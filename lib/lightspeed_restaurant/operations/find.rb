# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Find
      def find(id, configuration = nil, read_timeout: nil)
        path = "#{default_resource_path}/#{id}"
        response = JSON.parse(
          LightspeedRestaurantClient.get(path, {}, configuration, read_timeout)
        )
        new(response)
      end
    end
  end
end
