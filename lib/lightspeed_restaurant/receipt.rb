require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurantClient
  class Receipt < LightspeedRestaurantClient::Base
    extend Operations::List

    def self.resource_name
      'Receipt'
    end

    def self.resource_path
      "/rest/financial/#{resource_name.downcase}"
    end
  end
end
