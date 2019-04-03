# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Destroy
      def destroy
        JSON.parse(LightspeedRestaurantClient.delete(self.class.default_resource_path + "/#{id}"))
        self
      end
    end
  end
end
