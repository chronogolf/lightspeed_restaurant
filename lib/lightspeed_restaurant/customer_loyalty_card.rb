# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurantClient
  class CustomerLoyaltyCard < LightspeedRestaurantClient::Base
    include Operations::List
    include Operations::Create

    def self.resource_name
      'LoyaltyCard'
    end

    def default_resource_path
      "#{Customer.default_resource_path}/#{customer_id}/#{self.class.resource_name.downcase}"
    end
  end
end
