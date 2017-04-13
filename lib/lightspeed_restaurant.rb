#   Lightspeed Restaurant Ruby Bindings
#   API spec at http://staging-exact-integration.posios.com/PosServer/swagger-ui.html

require 'excon'
require 'json'

require 'lightspeed_restaurant/version'
require 'lightspeed_restaurant/request'

require 'lightspeed_restaurant/customer'
require 'lightspeed_restaurant/customer_credit_change'
require 'lightspeed_restaurant/receipt'
require 'lightspeed_restaurant/company'

module LightspeedRestaurant
  class << self
    attr_accessor :api_token, :base_uri

    def get(path, body = {}, query = {})
      request(path, body, query).perform(method: :get)
    end

    def post(path, body = {}, query = {})
      request(path, body, query).perform(method: :post)
    end

    def put(path, body = {}, query = {})
      request(path, body, query).perform(method: :put)
    end

    def delete(path, body = {}, query = {})
      request(path, body, query).perform(method: :delete)
    end

    private

    def request(path, body, query)
      Request.new(@base_uri, path, @api_token, body, query)
    end
  end
end
