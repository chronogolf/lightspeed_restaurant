# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/find'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/update'

module LightspeedRestaurantClient
  class ExternalPaymentProvider < LightspeedRestaurantClient::Base
    extend Operations::Create
    extend Operations::Find
    extend Operations::List
    extend Operations::Update

    def self.resource_name
      'externalPaymentProvider'
    end

    def self.default_resource_path
      "/rest/partner/v1/#{resource_name}/"
    end
  end
end
