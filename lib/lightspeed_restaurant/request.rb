# frozen_string_literal: true

require 'lightspeed_restaurant/errors/lightspeed_restaurant_error'
require 'lightspeed_restaurant/errors/api_error'
require 'lightspeed_restaurant/errors/authentication_error'
require 'lightspeed_restaurant/errors/invalid_request_error'
require 'lightspeed_restaurant/errors/not_found_error'
require 'uri'

module LightspeedRestaurantClient
  class Request
    STAGING_URL = 'http://staging-integration.posios.com'

    attr_reader :base_uri, :path, :token, :body, :headers, :query, :logger, :connection

    def initialize(base_uri, path, token, body = {}, query = {}, logger = nil)
      @base_uri   = base_uri || STAGING_URL
      @headers    = { 'Content-Type' => 'application/json', 'X-Auth-Token' => token }
      @body       = body.to_json
      @query      = query
      @path       = '/PosServer' + path
      @connection = Excon.new(@base_uri)
      @logger = logger || begin
        require 'logger'
        ::Logger.new($stdout)
      end
    end

    def perform(**args)
      log_request(args[:method])
      response = connection.request(args.merge(path: path, headers: headers, body: body, query: query))
      if [200, 201].include?(response.status)
        response.body
      else
        handle_error(response)
      end
    end

    private

    def log_request(http_method)
      logger.info('request') do
        "#{http_method} #{base_uri}#{path} : #{query} - #{body}"
      end
    end

    def handle_error(response)
      logger.error('response') { "Error : #{response.status} #{response.body}" }
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
