# frozen_string_literal: true

require 'lightspeed_restaurant/base'
require 'lightspeed_restaurant/operations/list'

module LightspeedRestaurantClient
  class Company < LightspeedRestaurantClient::Base
    extend Operations::Find
    extend Operations::List

    def self.resource_name
      'Company'
    end

    def self.default_resource_path
      "/rest/core/#{resource_name.downcase}"
    end
  end
end
