# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Save
      def save(configuration = nil)
        LightspeedRestaurantClient.put(self.class.resource_path + "/#{id}", self, {}, configuration)
        self
      end
    end
  end
end
