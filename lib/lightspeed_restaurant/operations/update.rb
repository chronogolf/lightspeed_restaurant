# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Update
      def update(id, attributes)
        updated_object = new(attributes)
        LightspeedRestaurantClient.put(resource_path + "/#{id}", updated_object)
        updated_object
      end
    end
  end
end
