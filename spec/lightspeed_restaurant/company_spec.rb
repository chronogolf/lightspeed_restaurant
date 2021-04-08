# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe Company do
    setup_api_token

    let(:resource_name) { 'company' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 1 }
      end
    end

    context 'when finding' do
      it_behaves_like 'a find operation' do
        let(:resource_id) { 14160 }

        it 'returns the company datas' do
          result = described_class.find(resource_id)
          expect(result.id).to eq 14160
        end
      end
    end
  end
end
