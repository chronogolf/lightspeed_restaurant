module LightspeedRestaurant
  module Operations
    module Find
      def find(id)
        response = JSON.parse(LightspeedRestaurant.get(resource_path + "/#{id}"))
        self.new(response)
      end
    end
  end
end
