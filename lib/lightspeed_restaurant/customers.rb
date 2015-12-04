require 'lightspeed_restaurant/customer'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/find'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/update'

module LightspeedRestaurant
  class Customers
    include LightspeedRestaurant::Operations::List
    include LightspeedRestaurant::Operations::Find
    include LightspeedRestaurant::Operations::Create
    include LightspeedRestaurant::Operations::Update

    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def self.resource_name
      'Customer'
    end

    def self.resource_path
      LightspeedRestaurant::Core.resource_path + resource_name.downcase
    end
  end
end
