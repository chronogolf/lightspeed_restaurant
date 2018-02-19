require 'spec_helper'

module LightspeedRestaurantClient
  describe CustomerLoyaltyCard do
    setup_api_token

    subject { LightspeedRestaurantClient::CustomerLoyaltyCard }

    context 'creating' do
      let(:resource_params) { { customer_id: 2365 } }
      let(:valid_params)    { { barcode: 'B1234' } }

      it_behaves_like 'a create operation on an instantiated class' do
        let(:expected_error) { VCR::Errors::UnhandledHTTPRequestError }
        let(:invalid_params) { { barcode: 1234 } }
      end

      it 'returns the payload' do
        VCR.use_cassette('customerloyaltycard/create', allow_playback_repeats: true) do
          resource = described_class.new(resource_params).create(valid_params)
          expect(resource.code).to eq 'B1234'
        end
      end
    end
  end
end
