# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Renew
      def renew(id, configuration = nil)
        response = JSON.parse(LightspeedRestaurantClient.post("#{default_resource_path}/#{id}/renew", {}, configuration))
        new(response)
      end
    end
  end
end
