# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Find
      def find(id)
        response = JSON.parse(LightspeedRestaurantClient.get(resource_path + "/#{id}"))
        new(response)
      end
    end
  end
end
