require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurant
  class Company < LightspeedRestaurant::Base
    extend Operations::List

    def self.resource_name
      'Company'
    end

    def self.resource_path
      "/rest/core/#{resource_name.downcase}"
    end
  end
end
