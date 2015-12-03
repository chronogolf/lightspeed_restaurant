module LightspeedRestaurant
  module Operations
    module Create
      def create(attributes)
        response = client.post(self.class.resource_path, attributes)
        LightspeedRestaurant.const_get(self.class.resource_name).new(response)
      end
    end
  end
end
