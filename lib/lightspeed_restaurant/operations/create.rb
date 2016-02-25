module LightspeedRestaurant
  module Operations
    module Create
      def create(attributes)
        response = LightspeedRestaurant.post(resource_path, attributes)
        if is_a?(Class)
          new(attributes.merge!(id: response.to_i))
        else
          self.class.new(attributes.merge!(id: response.to_i))
        end
      end
    end
  end
end
