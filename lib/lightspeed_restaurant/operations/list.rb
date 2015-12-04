module LightspeedRestaurant
  module Operations
    module List
      def list(params = {})
        response = JSON.parse(LightspeedRestaurant.get(resource_path, {}, params))
        instantiate(response['results'])
      end
      alias_method :all, :list

      private

      def instantiate(records)
        records.map do |record|
          new(record)
        end
      end
    end
  end
end
