# frozen_string_literal: true

module LightspeedRestaurantClient
  class Configuration
    attr_reader :api_token, :base_uri

    def initialize(api_token, base_uri)
      @api_token = api_token
      @base_uri = base_uri
    end

    def with(attributes)
      attributes_with_string_keys = {}
      attributes.dup.each_pair do |name, value|
        attributes_with_string_keys[name.to_s] = value
      end
      self.class.new(
        attributes_with_string_keys.fetch('api_token', api_token),
        attributes_with_string_keys.fetch('base_uri', base_uri)
      )
    end
  end
end
