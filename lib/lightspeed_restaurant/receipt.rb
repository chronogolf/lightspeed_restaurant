require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurant
  class Receipt < LightspeedRestaurant::Base
    extend LightspeedRestaurant::Operations::List

    def self.resource_name
      'Receipt'
    end

    def self.resource_path
      "/rest/financial/#{resource_name.downcase}"
    end
  end
end
