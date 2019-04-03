# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Save
      def save
        LightspeedRestaurantClient.put(self.class.default_resource_path + "/#{id}", self)
        self
      end
    end
  end
end
