require 'lightspeed_restaurant/errors/lightspeed_restaurant_error'
require 'lightspeed_restaurant/errors/api_error'
require 'lightspeed_restaurant/errors/authentication_error'
require 'lightspeed_restaurant/errors/invalid_request_error'
require 'lightspeed_restaurant/errors/not_found_error'
require 'uri'

module LightspeedRestaurant
  class Request
    def initialize(base_url, path, token, body = {}, query = {})
      @base_url   = base_url || 'http://staging-exact-integration.posios.com'
      @headers    = { 'Content-Type' => 'application/json', 'X-Auth-Token' => token }
      @body       = body.to_json
      @query      = query
      @path       = '/PosServer' + path
      @connection = Excon.new(@base_url)
    end

    def perform(**args)
      response = @connection.request(args.merge(path: @path, headers: @headers, body: @body, query: @query))
      if [200, 201].include?(response.status)
        response.body
      else
        handle_error(response)
      end
    end

    private

    def handle_error(response)
      case response.status
      when 400
        raise invalid_request_error(response)
      when 401
        raise authentication_error(response)
      when 403
        raise unauthorized_error(response)
      when 404
        raise not_found_error(response)
      else
        raise response_object_error(response)
      end
    end

    def unauthorized_error(response)
      UnauthorizedError.new('Unauthorized resource', response.status, response.body, response.headers)
    end

    def not_found_error(response)
      NotFoundError.new('Resource not found', response.status, response.body, response.headers)
    end

    def response_object_error(response)
      APIError.new("Invalid response object from API: #{JSON.parse(response.body)['description']}",
                   response.status, response.body, response.headers)
    end

    def invalid_request_error(response)
      InvalidRequestError.new(JSON.parse(response.body)['description'],
                              response.status, response.body, response.headers)
    end

    def authentication_error(response)
      AuthenticationError.new(JSON.parse(response.body)['description'],
                              response.status, response.body, response.headers)
    end
  end
end
