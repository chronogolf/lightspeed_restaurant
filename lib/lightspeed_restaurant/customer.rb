require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/find'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/update'
require 'lightspeed_restaurant/operations/save'

module LightspeedRestaurant
  class Customer < LightspeedRestaurant::Base
    include LightspeedRestaurant::Operations::Save
    extend LightspeedRestaurant::Operations::Create
    extend LightspeedRestaurant::Operations::Update
    extend LightspeedRestaurant::Operations::Find
    extend LightspeedRestaurant::Operations::List

    def self.resource_name
      'Customer'
    end

    def self.resource_path
      "/rest/core/#{resource_name.downcase}"
    end
  end
end
