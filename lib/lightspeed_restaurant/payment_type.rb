# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/create'

module LightspeedRestaurantClient
  class PaymentType < LightspeedRestaurantClient::Base
    extend Operations::Create
    extend Operations::List

    def self.resource_name
      'PaymentType'
    end

    def self.default_resource_path
      "/rest/core/#{resource_name.downcase}"
    end

    def self.list_resource_path
      "/rest/onlineordering/#{resource_name.downcase}"
    end
  end
end
