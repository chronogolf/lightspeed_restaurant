shared_examples 'a list operation' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it "can fetch all resource's occurrences" do
    VCR.use_cassette("#{resource_name}/list") do
      resources = defined?(params) ? described_class.all(params) : described_class.all
      expect(resources).to be_an(Array)
      expect(resources.count).to eq(results_count)

      resource = resources.first
      expect(resource).to be_a(described_class)
    end
  end
end

shared_examples 'a list operation on an instantiated class' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it "can fetch all resource's occurrences" do
    VCR.use_cassette("#{resource_name}/list") do
      resources = described_class.new(resource_params).all
      expect(resources).to be_an(Array)
      expect(resources.count).to eq(results_count)
      expect(resources.first).to be_a(described_class)
    end
  end
end
