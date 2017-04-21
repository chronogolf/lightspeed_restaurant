require 'spec_helper'

module LightspeedRestaurantClient
  describe Receipt do
    setup_api_token

    subject { LightspeedRestaurantClient::Receipt }

    context 'listing' do
      it_behaves_like 'a list operation' do
        let(:params) { { date: '2016-02-23' } }
        let(:results_count) { 2 }
      end
    end
  end
end
