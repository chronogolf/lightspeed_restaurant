# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Save
      def save(configuration = nil)
        LightspeedRestaurantClient.put(self.class.default_resource_path + "/#{id}", self, {},
                                       configuration)
        self
      end
    end
  end
end
