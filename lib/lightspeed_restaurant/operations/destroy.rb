module LightspeedRestaurant
  module Operations
    module Destroy
      def destroy(id)
        response = JSON.parse(client.delete(self.class.resource_path + "/#{id}"))
        LightspeedRestaurant.const_get(self.class.resource_name).new(response)
      end
    end
  end
end
