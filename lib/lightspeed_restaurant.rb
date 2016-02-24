#   Lightspeed Restaurant Ruby Bindings
#   API spec at http://staging-exact-integration.posios.com/PosServer/swagger-ui.html

require 'excon'
require 'json'

require 'lightspeed_restaurant/version'
require 'lightspeed_restaurant/request'

require 'lightspeed_restaurant/customer'
require 'lightspeed_restaurant/receipt'

module LightspeedRestaurant
  class << self
    attr_accessor :api_token, :base_url
  end

  def self.get(path, body = {}, query = {})
    request(path, body, query).perform(method: :get)
  end

  def self.post(path, body = {}, query = {})
    request(path, body, query).perform(method: :post)
  end

  def self.put(path, body = {}, query = {})
    request(path, body, query).perform(method: :put)
  end

  def self.delete(path, body = {}, query = {})
    request(path, body, query).perform(method: :delete)
  end

  private_class_method :request

  def self.request(path, body, query)
    LightspeedRestaurant::Request.new(@base_url, path, @api_token, body, query)
  end
end
