require 'spec_helper'

module LightspeedRestaurant
  describe Customer do
    setup_api_token

    subject { LightspeedRestaurant::Customer }

    context 'listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 4 }
      end
    end

    context 'finding' do
      it_behaves_like 'a find operation' do
        let(:resource_id) { 2366 }
      end
    end

    context 'creating' do
      let(:valid_params) { { firstName: 'test5', lastName: 'test5', email: 'test5@test.com' } }

      it_behaves_like 'a create operation' do
        let(:valid_params) { { firstName: 'test5', lastName: 'test5', email: 'test5@test.com' } }
        let(:invalid_params) { { email: '' } }
      end

      it 'returns the customer id' do
        VCR.use_cassette('customer/create', allow_playback_repeats: true) do
          resource = described_class.create(valid_params)
          expect(resource.id).to eq 2617
        end
      end
    end

    context 'updating' do
      it_behaves_like 'an update operation' do
        let(:resource_id) { 2366 }
        let(:attribute_to_update) { 'email' }
        let(:valid_params) { { email: 'test-update@test.com' } }
        let(:invalid_params) { { email: '' } }
      end
    end

    context 'saving' do
      it_behaves_like 'an save operation' do
        let(:resource_id) { 2366 }
        let(:attribute_to_update) { 'email' }
        let(:valid_attribute_value) { 'test-save@test.com' }
        let(:invalid_attribute_value) { '' }
      end
    end
  end
end
