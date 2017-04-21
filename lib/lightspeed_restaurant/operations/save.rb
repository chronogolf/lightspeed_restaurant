module LightspeedRestaurantClient
  module Operations
    module Save
      def save
        LightspeedRestaurantClient.put(self.class.resource_path + "/#{id}", self)
        self
      end
    end
  end
end
