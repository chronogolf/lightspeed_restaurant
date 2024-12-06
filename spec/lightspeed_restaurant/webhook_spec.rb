# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe Webhook do
    setup_api_token

    let(:resource_name) { 'webhook' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 2 }
      end
    end

    context 'when finding' do
      it_behaves_like 'a find operation' do
        let(:resource_id) { 1920 }

        it 'includes the notification URL' do
          result = described_class.find(resource_id)
          expect(result.notificationUrl).to eq 'https://localhost'
        end
      end
    end

    context 'when creating' do
      let(:valid_params) { { notificationUrl: 'https://localhost', type: 'RECEIPT_CREATED', timeToLiveInSeconds: 900 } }
      let(:invalid_params) { { notificationUrl: '' } }

      context 'with invalid params' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create_invalid") { test.run }
        end

        it 'raises an APIError' do
          expect do
            described_class.create(invalid_params)
          end.to raise_error(LightspeedRestaurantClient::InvalidRequestError)
        end

        it 'logs the error' do
          expect do
            described_class.create(invalid_params)
          rescue LightspeedRestaurantClient::InvalidRequestError
          end.to change { fake_logger.errors.count }.by(1)
                                                    .and change { fake_logger.errors.last }.to include('Error')
        end
      end

      context 'when the creation is successful' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) { test.run }
        end

        it 'returns the webhook id' do
          resource = described_class.create(valid_params)
          expect(resource.id).to eq 1921
        end
      end
    end

    context 'when renewing' do
      let(:resource_id) { 17 }

      context 'with valid params but too early for renewal' do
        around do |test|
          VCR.use_cassette("#{resource_name}/renew_invalid", allow_playback_repeats: true) { test.run }
        end

        it 'raises an UnauthorizedError' do
          expect do
            described_class.renew(resource_id)
          end.to raise_error(LightspeedRestaurantClient::UnauthorizedError)
        end

        it 'logs the error' do
          expect do
            described_class.renew(resource_id)
          rescue LightspeedRestaurantClient::UnauthorizedError
          end.to change { fake_logger.errors.count }.by(1)
                                                    .and change { fake_logger.errors.last }.to include('Error')
        end
      end

      context 'with valid params' do
        around do |test|
          VCR.use_cassette("#{resource_name}/renew", allow_playback_repeats: true) { test.run }
        end

        it 'returns the webhook id' do
          resource = described_class.renew(resource_id)
          expect(resource.id).to eq 17
        end
      end
    end
  end
end
