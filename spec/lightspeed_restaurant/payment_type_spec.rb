# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe PaymentType do
    setup_api_token

    let(:resource_name) { 'paymenttype' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 9 }
      end
    end

    context 'when creating' do
      let(:valid_params) do
        { description: 'Credit card', name: 'Visa credit card', typeId: 4 }
      end

      it_behaves_like 'a create operation' do
        let(:invalid_params) { { name: '' } }
      end

      context 'when the creation is successful' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) { test.run }
        end

        it 'returns the payment typr id' do
          resource = described_class.create(valid_params)
          expect(resource.id).to eq 8219
        end
      end
    end
  end
end
