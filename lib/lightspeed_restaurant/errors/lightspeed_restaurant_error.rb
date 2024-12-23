# frozen_string_literal: true

module LightspeedRestaurantClient
  class LightspeedRestaurantClientError < StandardError
    attr_reader :message, :http_status, :http_body, :http_headers, :request_id, :json_body

    def initialize(message = nil, http_status = nil, http_body = nil, http_headers = nil)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @http_headers = http_headers || {}
      @request_id = @http_headers[:request_id]
    end

    def to_s
      status_string = @http_status.nil? ? '' : "(Status #{@http_status}) "
      id_string = @request_id.nil? ? '' : "(Request #{@request_id}) "
      "#{status_string}#{id_string}#{@message}"
    end
  end
end
