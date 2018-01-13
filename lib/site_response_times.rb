require "site_response_times/version"
require 'benchmark'
require 'uri'
require 'net/http'

module SiteResponseTimes
	# @total_response_time = 0
	# @times_to_run = 10
	# @site_to_check = "https://about.gitlab.com"
	# @seconds_between_status_checks = 10


	# def self.check_gitlab
	# 	uri = URI(@site_to_check)

	# 	@times_to_run.times do
	# 		response_time = get_response_time(uri)
	# 		@total_response_time += response_time

	# 		sleep(@seconds_between_status_checks - response_time)
	# 	end

	# 	@total_response_time / @times_to_run.to_f
	# end


	# private

	# def self.get_response_time(uri)
	# 	Benchmark.measure { Net::HTTP.get(uri) }.real
	# end

end
