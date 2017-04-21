require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/find'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/update'
require 'lightspeed_restaurant/operations/save'

module LightspeedRestaurantClient
  class Customer < LightspeedRestaurantClient::Base
    include Operations::Save
    extend Operations::Create
    extend Operations::Update
    extend Operations::Find
    extend Operations::List

    def self.resource_name
      'Customer'
    end

    def self.resource_path
      "/rest/core/#{resource_name.downcase}"
    end
  end
end
