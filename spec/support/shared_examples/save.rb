# frozen_string_literal: true

shared_examples 'an save operation' do
  around do |test|
    VCR.use_cassette("#{resource_name}/find") { test.run }
  end

  let!(:resource) { described_class.find(resource_id) }

  context 'with valid params' do
    around do |test|
      VCR.use_cassette("#{resource_name}/save") { test.run }
    end

    it 'with valid params' do
      resource.send("#{attribute_to_update}=", valid_attribute_value)
      resource.save
      expect(resource.send(attribute_to_update)).to eq(valid_attribute_value)
    end

    it 'logs the request' do
      expect do
        resource.save
      end.to change { fake_logger.infos.count }.by(1)
         .and change { fake_logger.infos.last }.to include('put', resource_name)
    end
  end

  context 'with invalid params' do
    around do |test|
      VCR.use_cassette("#{resource_name}/save_invalid") { test.run }
    end

    it 'returns an error' do
      expect do
        resource.send("#{attribute_to_update}=", invalid_attribute_value)
        resource.save
      end.to raise_error(LightspeedRestaurantClient::APIError)
    end

    it 'logs the error' do
      expect do
        resource.save
      rescue LightspeedRestaurantClient::APIError
      end.to change { fake_logger.errors.count }.by(1)
    end
  end
end
