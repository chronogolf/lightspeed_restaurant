# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Create
      def create(attributes, configuration = nil)
        response = JSON.parse(LightspeedRestaurantClient.post(default_resource_path, attributes, {}, configuration))
        response = handle_create_response(response, attributes)
        return new(response) if is_a?(Class)

        self.class.new(response)
      end

      private

      def handle_create_response(response, attributes)
        if response.is_a?(Numeric)
          attributes.merge(id: response)
        elsif self == LightspeedRestaurantClient::ExternalPaymentProvider
          response.merge(id: response['data']['id'])
        else
          response
        end
      end
    end
  end
end
