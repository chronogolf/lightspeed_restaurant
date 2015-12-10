module LightspeedRestaurant
  module Operations
    module Update
      def update(id, attributes)
        updated_object = new(attributes)
        LightspeedRestaurant.put(resource_path + "/#{id}", updated_object)
        updated_object
      end
    end
  end
end
