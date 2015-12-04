module LightspeedRestaurant
  module Operations
    module Update
      def update
        LightspeedRestaurant.put(self.class.resource_path + "/#{id}", self)
        self
      end
      alias_method :save, :update
    end
  end
end
