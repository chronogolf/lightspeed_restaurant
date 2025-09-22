# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Patch
      def patch(id, attributes, configuration = nil)
        updated_object = new(attributes)
        LightspeedRestaurantClient.patch(default_resource_path + id_path(id), updated_object, {}, configuration)
        updated_object
      end

      def id_path(id)
        return id.to_s if self == LightspeedRestaurantClient::ExternalPaymentProvider

        "/#{id}"
      end
    end
  end
end
