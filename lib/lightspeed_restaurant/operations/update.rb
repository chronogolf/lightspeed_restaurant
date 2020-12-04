# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Update
      def update(id, attributes, configuration = nil)
        updated_object = new(attributes)
        path = default_resource_path + "/#{id}"
        LightspeedRestaurantClient.put(path, updated_object, {}, configuration)
        updated_object
      end
    end
  end
end
