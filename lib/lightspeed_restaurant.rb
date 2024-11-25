# frozen_string_literal: true

#   Lightspeed Restaurant Ruby Bindings
#   API spec at http://stating-integration.posios.com/PosServer/swagger-ui.html

require 'excon'
require 'json'

require 'lightspeed_restaurant/company'
require 'lightspeed_restaurant/configuration'
require 'lightspeed_restaurant/customer_credit_change'
require 'lightspeed_restaurant/customer_establishment_order'
require 'lightspeed_restaurant/customer_loyalty_card'
require 'lightspeed_restaurant/customer'
require 'lightspeed_restaurant/inventory_product'
require 'lightspeed_restaurant/external_payment_provider'
require 'lightspeed_restaurant/payment_type'
require 'lightspeed_restaurant/product_group_product'
require 'lightspeed_restaurant/product_group'
require 'lightspeed_restaurant/receipt'
require 'lightspeed_restaurant/request'
require 'lightspeed_restaurant/version'

module LightspeedRestaurantClient
  class << self
    attr_accessor :api_token, :base_uri, :logger

    def default_configuration
      Configuration.new(@api_token, @base_uri)
    end

    def get(path, query = {}, configuration = nil)
      request(path, {}, query, configuration).perform(method: :get)
    end

    def post(path, body = {}, query = {}, configuration = nil)
      request(path, body, query, configuration).perform(method: :post)
    end

    def put(path, body = {}, query = {}, configuration = nil)
      request(path, body, query, configuration).perform(method: :put)
    end

    def delete(path, query = {}, configuration = nil)
      request(path, {}, query, configuration).perform(method: :delete)
    end

    private

    def request(path, body, query, configuration = nil)
      configuration ||= default_configuration
      Request.new(configuration.base_uri, path, configuration.api_token, body, query, @logger)
    end
  end
end
