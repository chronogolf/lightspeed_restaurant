module LightspeedRestaurant
  module Operations
    module Save
      def save
        LightspeedRestaurant.put(self.class.resource_path + "/#{id}", self)
        self
      end
    end
  end
end
