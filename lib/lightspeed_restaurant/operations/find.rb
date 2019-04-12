# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Find
      def find(id, configuration = nil)
        response = JSON.parse(LightspeedRestaurantClient.get(default_resource_path + "/#{id}", {}, configuration))
        new(response)
      end
    end
  end
end
