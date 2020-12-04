# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Save
      def save(configuration = nil)
        path = self.class.default_resource_path + "/#{id}"
        LightspeedRestaurantClient.put(path, self, {}, configuration)
        self
      end
    end
  end
end
