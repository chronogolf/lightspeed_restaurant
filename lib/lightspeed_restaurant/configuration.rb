# frozen_string_literal: true

module LightspeedRestaurantClient
  class Configuration
    attr_reader :api_token, :base_uri

    def initialize(api_token, base_uri)
      @api_token = api_token
      @base_uri = base_uri
    end

    def with(attributes)
      attributes_with_string_keys = attributes.transform_keys(&:to_s)
      self.class.new(
        attributes_with_string_keys.fetch('api_token', api_token),
        attributes_with_string_keys.fetch('base_uri', base_uri)
      )
    end
  end
end
