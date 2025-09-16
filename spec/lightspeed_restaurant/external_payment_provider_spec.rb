# frozen_string_literal: true

require 'spec_helper'

module LightspeedRestaurantClient
  describe ExternalPaymentProvider do
    setup_api_token

    let(:resource_name) { 'externalPaymentProvider' }
    let(:fake_logger) { FakeLogger.new }

    before { LightspeedRestaurantClient.logger = fake_logger }

    context 'when listing' do
      it_behaves_like 'a list operation' do
        let(:results_count) { 1 }
      end
    end

    context 'when finding' do
      it_behaves_like 'a find operation' do
        let(:resource_id) { 1 }

        it 'includes external payment providers' do
          result = described_class.find(resource_id)
          expect(result.data).to eq({
                                      'companyID' => 1,
                                      'creationDate' => '2024-11-17:28:02.467Z',
                                      'id' => 1,
                                      'name' => 'House Account (External)',
                                      'updateDate' => '2024-11-17:28:02.467Z',
                                      'url' => 'https://dummy-payment-url.com'
                                    })
        end
      end
    end

    context 'when creating' do
      let(:valid_params) do
        {
          companyId: 123,
          name: 'House Account (External)',
          url: 'https://dummy-payment-url.com',
          username: 'username',
          password: 'abc123'
        }
      end

      it_behaves_like 'a create operation' do
        let(:invalid_params) { { companyId: '' } }
      end

      context 'when the creation is successful' do
        around do |test|
          VCR.use_cassette("#{resource_name}/create", allow_playback_repeats: true) { test.run }
        end

        it 'returns the external payment provider id' do
          resource = described_class.create(valid_params)
          expect(resource.id).to eq 1
        end
      end
    end

    context 'when updating' do
      let(:resource_id) { 1 }

      around do |test|
        VCR.use_cassette("#{resource_name}/update", allow_playback_repeats: true) { test.run }
      end

      it "updates" do
        resource = described_class.update(resource_id, {username: "updated_name"})
        expect(resource.username).to eq "updated_name"
      end
    end
  end
end
