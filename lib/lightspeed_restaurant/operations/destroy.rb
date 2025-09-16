# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Destroy
      def destroy(configuration = nil)
        puts "im here " + self.class.to_s
        JSON.parse(LightspeedRestaurantClient.delete(self.class.default_resource_path + "/#{id}", {}, configuration))
        self
      end
    end
  end
end
