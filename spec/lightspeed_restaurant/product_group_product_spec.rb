# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe ProductGroupProduct do
    setup_api_token

    let(:resource_name) { 'product' }
    let(:fake_logger) { FakeLogger.new }
    let(:resource_params) { { product_group_id: 57137 } }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when creating' do
      let(:valid_params)    do
        {
          deliveryPrice: 0,
          deliveryPriceWithoutVat: 0,
          deliveryTaxClass: '',
          id: 0,
          info: 'info',
          name: 'name',
          price: 0,
          priceWithoutVat: 0,
          sequence: 0,
          stockAmount: 0,
          takeawayPrice: 0,
          takeawayPriceWithoutVat: 0,
          visible: false
        }
      end

      it_behaves_like 'a create operation on an instantiated class' do
        let(:expected_error) { LightspeedRestaurantClient::APIError }
        let(:invalid_params) { valid_params.tap { |p| p.delete(:id) } }
      end

      it 'returns the payload' do
        VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) do
          resource = described_class.new(resource_params).create(valid_params)
          expect(resource.id).to eq 154141
        end
      end
    end

    context "when listing" do
      it 'lists the products in the group' do
        VCR.use_cassette("#{resource_name}/list", allow_playback_repeats: true) do
          products = described_class.new(resource_params).list({})
          expect(products.length).to eq 6
          expect(products.first.id).to eq 57134
        end
      end
    end
  end
end
