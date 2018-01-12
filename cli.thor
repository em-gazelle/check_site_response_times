require 'uri'
require 'net/http'
require 'benchmark'
require 'thor'

class ResponseTime < Thor 
	
	desc "average", "url"
	def average(url=nil)
		total_response_time = 0
		times_to_run = 10
		seconds_between_requests = 10
		url ||= "https://about.gitlab.com"
		puts "We're getting #{times_to_run} different requests #{seconds_between_requests} seconds apart to find an accurate average response time from #{url}. This process requires about 1 min and 40 seconds."

		uri = URI(url)

		times_to_run.times do
			response_time = get_response_time(uri)
			total_response_time += response_time

			sleep(seconds_between_requests - response_time)
		end

		puts total_response_time / times_to_run.to_f
	end


	private

	def get_response_time(uri)
		Benchmark.measure { Net::HTTP.get(uri) }.real
	end


end
