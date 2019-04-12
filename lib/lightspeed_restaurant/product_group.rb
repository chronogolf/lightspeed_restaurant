# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurantClient
  class ProductGroup < LightspeedRestaurantClient::Base
    extend Operations::List

    def self.resource_name
      'ProductGroup'
    end

    def self.default_resource_path
      "/rest/inventory/#{resource_name.downcase}"
    end
  end
end
