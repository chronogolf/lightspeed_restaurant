module LightspeedRestaurant
  module Operations
    module List
      def list(params = {})
        response = client.get(self.class.resource_path, {}, params)
        instantiate(response['results'], LightspeedRestaurant.const_get(self.class.resource_name))
      end
      alias_method :all, :list

      private

      def instantiate(records, klass)
        records.map do |record|
          klass.new(record)
        end
      end
    end
  end
end
