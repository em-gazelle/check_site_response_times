require 'thor'
spec = Gem::Specification.find_by_name("site_response_times")
gem_root = spec.gem_dir
load File.join(gem_root, 'response_time.thor')


RSpec.describe ResponseTime do

	describe 'average' do
		context 'when no url supplied' do
			it 'outputs average response time in seconds with float format' do
				expect{ subject.average }.to output(/(is) [0-9|.]+ (seconds)/).to_stdout		
			end
		end

		context 'when url is supplied' do
			context 'when url is valid' do
				it 'when valid GET request, outputs average response time in seconds with float format' do
					expect{ subject.average("https://www.google.com/") }.to output(/(google.com) .*? (is) [0-9|.]+ (seconds)/).to_stdout
				end
			end
			context 'when url is invalid' do
				it 'throws error when URI is good, but url does not exist / cannot be opened' do 
					expect { subject.average("wwww.easy-way-out.com") }.to output(/Oops, looks like we can't submit a valid GET request to the url you provided/).to_stdout			
				end
				it 'throws same error when URI cannot process URL supplied' do
					expect { subject.average("easy way out") }.to output(/Oops, looks like we can't submit a valid GET request to the url you provided/).to_stdout
				end
			end
		end
	end
end
