shared_examples 'an update operation' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it 'with valid params' do
    VCR.use_cassette("#{resource_name}/update") do
      resource = described_class.update(resource_id, valid_params)
      expect(resource.send(attribute_to_update)).to eq(valid_params[attribute_to_update.to_sym])
    end
  end

  it 'with invalid params' do
    VCR.use_cassette("#{resource_name}/update_invalid") do
      expect do
        described_class.update(resource_id, invalid_params)
      end.to raise_error(LightspeedRestaurantClient::APIError)
    end
  end
end
