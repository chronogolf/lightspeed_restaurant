# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/create'

module LightspeedRestaurantClient
  class CustomerCreditChange < LightspeedRestaurantClient::Base
    include Operations::List
    include Operations::Create

    def initialize(customer_id)
      super
    end

    def self.resource_name
      'CreditChange'
    end

    def resource_path
      "#{Customer.resource_path}/#{customer_id}/#{self.class.resource_name.downcase}"
    end
  end
end
