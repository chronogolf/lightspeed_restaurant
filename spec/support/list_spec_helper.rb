shared_examples 'a list operation' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it "can fetch all resource's occurrences" do
    VCR.use_cassette("#{resource_name}/list") do
      resources = described_class.all
      expect(resources).to be_an(Array)
      expect(resources.count).to eq(results_count)

      resource = resources.first
      expect(resource).to be_a(described_class)
      expect(resource.id).to eq(resource_id)
    end
  end
end
