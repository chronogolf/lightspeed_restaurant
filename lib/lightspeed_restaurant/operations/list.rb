# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module List
      def list(params = {})
        response = JSON.parse(LightspeedRestaurantClient.get(resource_path, {}, params))
        results = response.is_a?(Array) ? response : response['results']
        instantiate(results)
      end
      alias all list

      private

      def instantiate(records)
        records.map do |record|
          is_a?(Class) ? new(record) : self.class.new(record)
        end
      end
    end
  end
end
