require 'lightspeed_restaurant/customers'

module LightspeedRestaurant
  module Core
    def customers
      @customers ||= LightspeedRestaurant::Customers.new(self)
    end

    def self.resource_path
      '/rest/core/'
    end
  end
end
