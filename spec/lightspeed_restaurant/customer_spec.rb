# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe Customer do
    setup_api_token

    let(:resource_name) { 'customer' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 4 }
      end
    end

    context 'when finding' do
      it_behaves_like 'a find operation' do
        let(:resource_id) { 2366 }

        it 'includes customer cards' do
          result = described_class.find(resource_id)
          expect(result.customerCards.size).to eq 1
          expect(result.customerCards.first['code']).to eq 'B1234'
        end
      end
    end

    context 'when creating' do
      let(:valid_params) { { firstName: 'test5', lastName: 'test5', email: 'test5@test.com' } }

      it_behaves_like 'a create operation' do
        let(:invalid_params) { { email: '' } }
      end

      context 'when the creation is successful' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) { test.run }
        end

        it 'returns the customer id' do
          resource = described_class.create(valid_params)
          expect(resource.id).to eq 2617
        end
      end
    end

    context 'when updating' do
      it_behaves_like 'an update operation' do
        let(:resource_id) { 2366 }
        let(:attribute_to_update) { 'email' }
        let(:valid_params) { { email: 'test-update@test.com' } }
        let(:invalid_params) { { email: '' } }
      end
    end

    context 'when saving' do
      it_behaves_like 'an save operation' do
        let(:resource_id) { 2366 }
        let(:attribute_to_update) { 'email' }
        let(:valid_attribute_value) { 'test-save@test.com' }
        let(:invalid_attribute_value) { '' }
      end
    end
  end
end
