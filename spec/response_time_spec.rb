require 'thor'
spec = Gem::Specification.find_by_name("site_response_times")
gem_root = spec.gem_dir
load File.join(gem_root, 'response_time.thor')


RSpec.describe ResponseTime do

	describe 'average' do
		context 'when params are absent or valid' do
			it 'outputs average response time in seconds with float format' do
				expect{ subject.average("seconds_between_requests:0", "times_to_run:2")}.to output(/(is) [0-9|.]+ (seconds)/).to_stdout		
			end
			it 'makes GET request to url specified and outputs average response time in seconds with float format' do
				expect{ subject.average("url:https://www.google.com", "seconds_between_requests:0", "times_to_run:2") }.to output(/(google.com).*? (is) [0-9|.]+ (seconds)/).to_stdout
			end
		end
		context 'when params are invalid' do
			it 'outputs error message when URI is good, but url does not exist / cannot be opened' do 
				expect { subject.average("url:wwww.easy-way-out.com") }.to output(/Oops, looks like we can't submit a valid GET request to the url you provided/).to_stdout			
			end
			it 'outputs error message when URI is technically valid, but cannot open URL' do
				expect { subject.average("url:easywayout") }.to output(/Oops, looks like we can't submit a valid GET request to the url you provided/).to_stdout
			end
			it 'discards extraneous params and runs program, no errors' do
				expect{ subject.average("seconds_between_requests:0", "times_to_run:2", "bored:my_own_command")}.to output(/(is) [0-9|.]+ (seconds)/).to_stdout		
			end
			it 'outputs invalid parameter error message if not an integer. Completes request successfully' do
				expect { subject.average("times_to_run:4none", "seconds_between_requests:0") }.to output(/Invalid parameter - using default/).to_stdout				
			end
			it 'outputs invalid parameter error message if integer is negative. Completes request successfully' do
				expect { subject.average("times_to_run:-4", "seconds_between_requests:0") }.to output(/Invalid parameter - using default/).to_stdout			
			end
		end
	end
end
