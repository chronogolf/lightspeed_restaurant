# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'
require 'lightspeed_restaurant/operations/find'
require 'lightspeed_restaurant/operations/create'
require 'lightspeed_restaurant/operations/renew'

module LightspeedRestaurantClient
  class Webhook < LightspeedRestaurantClient::Base
    extend Operations::Create
    extend Operations::List
    extend Operations::Find
    extend Operations::Renew

    def self.resource_name
      'Webhooks'
    end

    def self.default_resource_path
      "/rest/v1/#{resource_name.downcase}/subscriptions"
    end
  end
end
