RSpec.describe SiteResponseTimes do
  it "has a version number" do
    expect(SiteResponseTimes::VERSION).not_to be nil
  end

  it "calculates average response time and returns a Float" do
  	# in real time, 10 requests with 10 seconds between = 1:40 - utilize timecop.scale or other solution to accelerate time.
    expect(SiteResponseTimes.check_gitlab.class).to eq(Float)
  end

end
