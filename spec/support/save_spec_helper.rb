shared_examples 'an save operation' do
  let(:resource_name) { described_class.to_s.gsub(/^.*::/, '').downcase }

  it 'with valid params' do
    VCR.use_cassette("#{resource_name}/find") do
      @resource = subject.find(resource_id)
    end
    VCR.use_cassette("#{resource_name}/save") do
      @resource.send("#{attribute_to_update}=", valid_attribute_value)
      @resource = @resource.save
      expect(@resource.send(attribute_to_update)).to eq(valid_attribute_value)
    end
  end

  it 'with invalid params' do
    VCR.use_cassette("#{resource_name}/find") do
      @resource = subject.find(resource_id)
    end
    VCR.use_cassette("#{resource_name}/save_invalid") do
      expect do
        @resource.send("#{attribute_to_update}=", invalid_attribute_value)
        @resource.save
      end.to raise_error(LightspeedRestaurant::APIError)
    end
  end
end
