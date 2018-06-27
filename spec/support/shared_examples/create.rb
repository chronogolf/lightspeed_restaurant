# frozen_string_literal: true

shared_examples 'a create operation' do
  context 'with valid params' do
    subject(:valid_creation) do
      described_class.create(valid_params)
    end

    around do |test|
      VCR.use_cassette("#{resource_name}/create") { test.run }
    end

    it 'creates' do
      resource = valid_creation
      expect(resource).to be_a(described_class)
      expect(resource.id).not_to be_nil
      expect(resource.id).not_to be_zero
    end

    it 'logs the request' do
      expect do
        valid_creation
      end.to change { fake_logger.infos.count }.by(1)
         .and change { fake_logger.infos.last }.to include('post', resource_name)
    end
  end

  context 'with invalid params' do
    around do |test|
      VCR.use_cassette("#{resource_name}/create_invalid") { test.run }
    end

    it 'raises an APIError' do
      expect do
        described_class.create(invalid_params)
      end.to raise_error(LightspeedRestaurantClient::APIError)
    end

    it 'logs the error' do
      expect do
        described_class.create(invalid_params)
      rescue LightspeedRestaurantClient::APIError
      end.to change { fake_logger.errors.count }.by(1)
         .and change { fake_logger.errors.last }.to include('Error')
    end
  end
end

shared_examples 'a create operation on an instantiated class' do
  let(:expected_error) { LightspeedRestaurantClient::InvalidRequestError }

  context 'with valid params' do
    subject(:valid_creation) do
      described_class.new(resource_params).create(valid_params)
    end

    around do |test|
      VCR.use_cassette("#{resource_name}/create") { test.run }
    end

    it 'creates' do
      resource = valid_creation
      expect(resource).to be_a(described_class)
      id = resource.respond_to?(:id) ? resource.id : resource.uuid
      expect(id).not_to be_nil
      expect(id).not_to be_zero unless id.is_a?(String)
    end

    it 'logs the request' do
      expect do
        valid_creation
      end.to change { fake_logger.infos.count }.by(1)
         .and change { fake_logger.infos.last }.to include('post', resource_name)
    end
  end

  context 'with invalid params' do
    around do |test|
      VCR.use_cassette("#{resource_name}/create_invalid") { test.run }
    end

    it 'raises an error' do
      expect do
        described_class.new(resource_params).create(invalid_params)
      end.to raise_error(expected_error)
    end

    it 'logs the error' do
      expect do
        described_class.new(resource_params).create(invalid_params)
      rescue expected_error
      end.to change { fake_logger.errors.count }.by(1)
         .and change { fake_logger.errors.last }.to include('Error')
    end
  end
end
