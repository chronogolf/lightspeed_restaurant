# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe Receipt do
    setup_api_token

    let(:resource_name) { 'receipt' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:params) { { date: '2016-02-23' } }
        let(:results_count) { 2 }
      end
    end
  end
end
