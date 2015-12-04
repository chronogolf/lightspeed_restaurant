module LightspeedRestaurant
  module Operations
    module Destroy
      def destroy
        JSON.parse(LightspeedRestaurant.delete(self.class.resource_path + "/#{id}"))
        self
      end
    end
  end
end
