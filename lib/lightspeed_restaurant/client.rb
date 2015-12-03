require 'lightspeed_restaurant/request'
require 'lightspeed_restaurant/core'

module LightspeedRestaurant
  class Client
    include LightspeedRestaurant::Core

    attr_accessor :api_token, :base_url

    def initialize(api_token, base_url: nil)
      @base_url  = base_url
      @api_token = api_token
    end

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
      LightspeedRestaurant::Request.new(@base_url, path, @api_token, body, query)
    end
  end
end
