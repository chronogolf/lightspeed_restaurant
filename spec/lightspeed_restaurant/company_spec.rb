require 'spec_helper'

module LightspeedRestaurantClient
  describe Company do
    setup_api_token

    subject { LightspeedRestaurantClient::Company }

    context 'listing' do
      it_behaves_like 'a list operation' do
        let(:results_count)   { 1 }
      end
    end
  end
end
