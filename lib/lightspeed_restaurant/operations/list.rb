# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module List
      def list(params = {}, configuration = nil)
        response = JSON.parse(LightspeedRestaurantClient.get(resource_path, params, configuration))
        results = response.is_a?(Array) ? response : response['results']
        instantiate(results)
      end
      alias all list

      private

      def resource_path
        respond_to?(:list_resource_path) ? list_resource_path : default_resource_path
      end

      def instantiate(records)
        records.map do |record|
          is_a?(Class) ? new(record) : self.class.new(record)
        end
      end
    end
  end
end
