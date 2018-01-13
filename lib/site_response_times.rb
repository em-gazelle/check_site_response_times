require "site_response_times/version"
require 'benchmark'
require 'uri'
require 'net/http'
require 'thor'

module SiteResponseTimes
	class ResponseTime < Thor 
		
		desc "average url:string seconds_between_requests:integer times_to_run:integer", "Calculates average response time from making an HTTP GET request to any url (default about.gitlab.com) X number of times (default is 6) Y seconds apart (default is 10)."
		def average(*args)
			begin
				params = args.map{|arg| (arg.downcase.partition(":").values_at(0,2))}.to_h

				total_response_time = 0
				times_to_run = validate_positive_integer(params["times_to_run"]) || 6
				seconds_between_requests = validate_positive_integer(params["seconds_between_requests"]) || 10
				
				url = params["url"] || "https://about.gitlab.com"
				puts "We're getting #{times_to_run} different requests #{seconds_between_requests} seconds apart to find an accurate average response time from #{url}. This process requires about #{times_to_run * seconds_between_requests} seconds."

				uri = URI(url)

				times_to_run.times do
					response_time = get_response_time(uri)
					total_response_time += response_time

					sleep(seconds_between_requests - response_time) unless seconds_between_requests.zero?
				end

				puts "Average site response time from #{url} is #{(total_response_time / times_to_run.to_f)} seconds"
			rescue
				puts "Oops, looks like we can't submit a valid GET request to the url you provided. Please provide a proper URL or omit the URL to use the default [https://about.gitlab.com]"
			end
		end


		private

		def get_response_time(uri)
			Benchmark.measure { Net::HTTP.get(uri) }.real
		end

		def validate_positive_integer(string_number=nil)
			if string_number.nil?
				nil
			elsif string_number.match(/^[0-9]+$/) && string_number.to_i >= 0
				string_number.to_i
			else
				puts "Invalid parameter - using default"
				nil
			end
		end

	end
end

SiteResponseTimes::ResponseTime.start(argv)