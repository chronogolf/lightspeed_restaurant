# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/create'

module LightspeedRestaurantClient
  class CustomerEstablishmentOrder < LightspeedRestaurantClient::Base
    include Operations::Create

    def self.resource_name
      'EstablishmentOrder'
    end

    def default_resource_path
      "/rest/onlineordering/customer/#{customer_id}/#{self.class.resource_name.downcase}"
    end
  end
end
