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
      let(:resource_params) { { customer_id: 2365 } }
      let(:valid_params)    { { change: 10 } }

      it_behaves_like 'a create operation on an instantiated class' do
        let(:invalid_params)  { { change: 'hahaha' } }
      end

      it 'returns the payload' do
        VCR.use_cassette('customercreditchange/create', allow_playback_repeats: true) do
          resource = described_class.new(resource_params).create(valid_params)
          expect(resource.changeQuantity).to eq 10.0
          expect(resource.id).to eq 6704
        end
      end
    end
  end
end
