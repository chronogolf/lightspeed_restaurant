# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe InventoryProduct do
    setup_api_token

    let(:resource_name) { 'inventory/product' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when finding single product' do
      let(:product_id) { '184948' }

      it 'returns the payload' do
        VCR.use_cassette("#{resource_name}/find", allow_playback_repeats: true) do
          resource = described_class.find(product_id)
          expect(resource.id).to eq 184948
        end
      end
    end
  end
end
