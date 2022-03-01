# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurantClient
  class InventoryProduct < LightspeedRestaurantClient::Base
    extend Operations::Find

    def self.resource_name
      'Inventory/Product'
    end

    def self.default_resource_path
      "/rest/#{resource_name.downcase}"
    end
  end
end
