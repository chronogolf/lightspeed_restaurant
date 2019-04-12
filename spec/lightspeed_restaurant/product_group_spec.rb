# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe ProductGroup do
    setup_api_token

    let(:resource_name) { 'productgroup' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 6 }
      end
    end
  end
end
