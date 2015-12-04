module LightspeedRestaurant
  module Operations
    module Create
      def create(attributes)
        response = client.post(self.class.resource_path, attributes)
        resource_class.new(attributes.merge!(id: response.to_i))
      end

      private

      def resource_class
        LightspeedRestaurant.const_get(self.class.resource_name)
      end
    end
  end
end
