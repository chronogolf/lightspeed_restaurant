require 'spec_helper'

module LightspeedRestaurant
  describe Customer do
    setup_api_token

    subject { LightspeedRestaurant::Customer }

    context 'listing' do
      it_behaves_like "a list operation" do
        let(:results_count) { 4 }
        let(:resource_id)   { 2365 }
      end
    end

    context 'finding' do
      it_behaves_like "a find operation" do
        let(:resource_id) { 2366 }
      end
    end

    context 'creating' do
      it_behaves_like "a create operation" do
        let(:valid_params) { { firstName: 'test5', lastName: 'test5', email: 'test5@test.com' } }
        let(:invalid_params) { { email: '' } }
      end
    end

    context 'updating' do
      it_behaves_like "an update operation" do
        let(:resource_id) { 2366 }
        let(:attribute_to_update) { 'email' }
        let(:valid_attribute_value) { 'test-update@test.com' }
        let(:invalid_attribute_value) { '' }
      end
    end
  end
end
