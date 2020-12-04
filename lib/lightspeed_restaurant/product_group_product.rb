# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/create'

module LightspeedRestaurantClient
  class ProductGroupProduct < LightspeedRestaurantClient::Base
    include Operations::Create

    def self.resource_name
      'Product'
    end

    def default_resource_path
      [
        ProductGroup.default_resource_path,
        product_group_id,
        self.class.resource_name.downcase
      ].join('/')
    end
  end
end
