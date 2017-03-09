shared_examples 'a create operation' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it 'with valid params' do
    VCR.use_cassette("#{resource_name}/create") do
      resource = described_class.create(valid_params)
      expect(resource).to be_a(described_class)
      expect(resource.id).not_to be_nil
      expect(resource.id).not_to be_zero
    end
  end

  it 'with invalid params' do
    VCR.use_cassette("#{resource_name}/create_invalid") do
      expect do
        described_class.create(invalid_params)
      end.to raise_error(LightspeedRestaurant::APIError)
    end
  end
end

shared_examples 'a create operation on an instantiated class' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it 'with valid params' do
    VCR.use_cassette("#{resource_name}/create") do
      resource = described_class.new(resource_params).create(valid_params)
      expect(resource).to be_a(described_class)
      expect(resource.id).not_to be_nil
      expect(resource.id).not_to be_zero
    end
  end

  it 'with invalid params' do
    VCR.use_cassette("#{resource_name}/create_invalid") do
      expect do
        described_class.new(resource_params).create(invalid_params)
      end.to raise_error(LightspeedRestaurant::InvalidRequestError)
    end
  end
end
