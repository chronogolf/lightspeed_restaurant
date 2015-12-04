module LightspeedRestaurant
  module Operations
    module Find
      def find(id)
        response = JSON.parse(client.get(self.class.resource_path + "/#{id}"))
        LightspeedRestaurant.const_get(self.class.resource_name).new(response)
      end
    end
  end
end
