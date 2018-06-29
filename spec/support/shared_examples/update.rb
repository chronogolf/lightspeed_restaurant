# frozen_string_literal: true

shared_examples 'an update operation' do
  context 'with valid params' do
    subject(:valid_update) do
      described_class.update(resource_id, valid_params)
    end

    around do |test|
      VCR.use_cassette("#{resource_name}/update") { test.run }
    end

    it 'updates the resource' do
      expect(valid_update.send(attribute_to_update)).to eq(valid_params[attribute_to_update.to_sym])
    end

    it 'logs the request' do
      expect do
        valid_update
      end.to change { fake_logger.infos.count }.by(1)
         .and change { fake_logger.infos.last }.to include('put', resource_name)
    end
  end

  context 'with invalid params' do
    around do |test|
      VCR.use_cassette("#{resource_name}/update_invalid") { test.run }
    end

    it 'returns an error' do
      expect do
        described_class.update(resource_id, invalid_params)
      end.to raise_error(LightspeedRestaurantClient::APIError)
    end

    it 'logs the error' do
      expect do
        described_class.update(resource_id, invalid_params)
      rescue LightspeedRestaurantClient::APIError
      end.to change { fake_logger.errors.count }.by(1)
    end
  end
end
