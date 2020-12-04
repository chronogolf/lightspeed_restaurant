# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Destroy
      def destroy(configuration = nil)
        path = self.class.default_resource_path + "/#{id}"
        JSON.parse(LightspeedRestaurantClient.delete(path, {}, configuration))
        self
      end
    end
  end
end
