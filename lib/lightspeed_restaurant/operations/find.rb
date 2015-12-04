module LightspeedRestaurant
  module Operations
    module Find
      def find(id)
        response = JSON.parse(LightspeedRestaurant.get(resource_path + "/#{id}"))
        new(response)
      end
    end
  end
end
