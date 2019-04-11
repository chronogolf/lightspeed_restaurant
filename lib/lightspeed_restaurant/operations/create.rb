# frozen_string_literal: true

module LightspeedRestaurantClient
  module Operations
    module Create
      def create(attributes, configuration = nil)
        response = LightspeedRestaurantClient.post(resource_path, attributes, {}, configuration)
        payload = build_payload(attributes, response)
        return new(payload) if is_a?(Class)

        self.class.new(payload)
      end

      private

      def build_payload(attributes, response)
        JSON.parse(response)
      rescue JSON::ParserError => error
        raise error if response.to_i.zero?
        attributes.merge!(id: response.to_i)
      end
    end
  end
end
