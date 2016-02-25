module LightspeedRestaurant
  module Operations
    module List
      def list(params = {})
        response = JSON.parse(LightspeedRestaurant.get(resource_path, {}, params))
        instantiate(response['results'])
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
