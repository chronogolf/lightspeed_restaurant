# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe CustomerEstablishmentOrder do
    setup_api_token

    let(:resource_name) { 'establishmentorder' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when creating' do
      let(:resource_params) { { customer_id: 32_767 } }
      let(:valid_params)    do
        {
          companyId: 14_445,
          description: 'HA payment',
          deliveryDate: '2019-03-31T18:00:00.299Z',
          note: 'HA payment',
          customerId: 32_767,
          numberOfCustomers: 1,
          orderItems: [
            {
              amount: 1,
              productId: 154_115,
              totalPrice: 0,
              totalPriceWithoutVat: 0,
              unitPrice: 0,
              unitPriceWithoutVat: 0
            }
          ],
          orderPayments: [
            {
              amount: -10,
              paymentTypeId: 8196,
              paymentTypeTypeId: 16
            },
            {
              amount: 10,
              paymentTypeId: 8195,
              paymentTypeTypeId: 4
            }
          ],
          status: 'ACCEPTED',
          type: 'takeaway'
        }
      end

      it_behaves_like 'a create operation on an instantiated class' do
        let(:expected_error) { LightspeedRestaurantClient::InvalidRequestError }
        let(:invalid_params) { valid_params.tap { |p| p.delete(:type) } }
      end

      it 'returns the payload' do
        VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) do
          resource = described_class.new(resource_params).create(valid_params)
          expect(resource.id).to eq 1_156_528
        end
      end
    end
  end
end
