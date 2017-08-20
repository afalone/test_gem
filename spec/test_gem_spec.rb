require "spec_helper"

RSpec.describe TestGem do
  it "has a version number" do
    expect(TestGem::VERSION).not_to be nil
  end
end
