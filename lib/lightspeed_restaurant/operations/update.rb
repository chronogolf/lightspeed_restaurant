module LightspeedRestaurant
  module Operations
    module Update
      def update
        response = client.put(self.class.resource_path + "/#{id}", to_json)
        LightspeedRestaurant.const_get(self.class.resource_name).new(response)
      end
      alias_method :save, :update
    end
  end
end
