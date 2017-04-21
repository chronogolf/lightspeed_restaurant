module LightspeedRestaurantClient
  module Operations
    module Destroy
      def destroy
        JSON.parse(LightspeedRestaurantClient.delete(self.class.resource_path + "/#{id}"))
        self
      end
    end
  end
end
