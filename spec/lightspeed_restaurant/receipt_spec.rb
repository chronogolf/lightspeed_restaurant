require 'spec_helper'

module LightspeedRestaurant
  describe Receipt do
    setup_api_token

    subject { LightspeedRestaurant::Receipt }

    context 'listing' do
      it_behaves_like 'a list operation' do
        let(:params) { { date: '2016-02-23' } }
        let(:results_count) { 2 }
        let(:resource_id)   { 198374 }
      end
    end
  end
end
