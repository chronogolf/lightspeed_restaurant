require 'spec_helper'

module LightspeedRestaurant
  describe CustomerCreditChange do
    setup_api_token

    subject { LightspeedRestaurant::CustomerCreditChange }

    context 'listing' do
      it_behaves_like 'a list operation on an instantiated class' do
        let(:resource_params) { { customer_id: 2365 } }
        let(:resource_id)     { 2365 }
        let(:results_count)   { 5 }
      end
    end
    context 'creating' do
      it_behaves_like 'a create operation on an instantiated class' do
        let(:resource_params) { { customer_id: 2365 } }
        let(:valid_params)    { { change: 10 } }
        let(:invalid_params)  { { change: 'hahaha' } }
      end
    end
  end
end
