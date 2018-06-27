# frozen_string_literal: true

shared_examples 'a find operation' do
  around do |test|
    VCR.use_cassette("#{resource_name}/find", allow_playback_repeats: true) { test.run }
  end

  it "can fetch a specific resource's occurrence by ID" do
    expect(described_class.find(resource_id)).to be_a(described_class)
  end
end
