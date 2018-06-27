# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe CustomerCreditChange do
    setup_api_token

    let(:resource_name) { 'creditchange' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation on an instantiated class' do
        let(:resource_params) { { customer_id: 2365 } }
        let(:resource_id)     { 2365 }
        let(:results_count)   { 5 }
      end
    end

    context 'when creating' do
      let(:resource_params) { { customer_id: 2365 } }
      let(:valid_params)    { { change: 10 } }

      it_behaves_like 'a create operation on an instantiated class' do
        let(:invalid_params)  { { change: 'hahaha' } }
      end

      context 'when the credit change is valid' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) { test.run }
        end

        it 'returns the payload' do
          resource = described_class.new(resource_params).create(valid_params)
          expect(resource.changeQuantity).to eq 10.0
          expect(resource.id).to eq 6704
        end
      end
    end
  end
end
