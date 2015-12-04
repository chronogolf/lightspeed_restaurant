module LightspeedRestaurant
  module Operations
    module Create
      def create(attributes)
        response = LightspeedRestaurant.post(resource_path, attributes)
        self.new(attributes.merge!(id: response.to_i))
      end
    end
  end
end
