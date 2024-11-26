# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Find
      def find(id, configuration = nil)
        response = JSON.parse(LightspeedRestaurantClient.get(default_resource_path + id_path(id), {}, configuration))
        new(response)
      end

      private

      def id_path(id)
        return id.to_s if self == LightspeedRestaurantClient::ExternalPaymentProvider

        "/#{id}"
      end
    end
  end
end
