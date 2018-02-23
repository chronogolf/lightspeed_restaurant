module LightspeedRestaurantClient
  module Operations
    module Update
      def update(id, attributes)
        updated_object = new(attributes)
        response = LightspeedRestaurantClient.put(resource_path + "/#{id}", updated_object)
        new(build_payload(attributes, response))
      end

      private

      def build_payload(attributes, response)
        begin
          return JSON.parse(response)
        rescue JSON::ParserError => error
          raise error if response.to_i.zero?
        end
        attributes.merge!(id: response.to_i)
      end
    end
  end
end
