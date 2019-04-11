# frozen_string_literal: true

require 'spec_helper'

describe LightspeedRestaurantClient do
  subject(:client) { described_class }

  it 'has a version number' do
    expect(client::VERSION).not_to be nil
  end

  it 'uses global configuration' do
    VCR.use_cassette('my_resource_with_foo_token') do
      client.api_token = 'foo'
      client.base_uri = 'http://default.com'
      client.get('/my_resource')
    end
  end

  context 'with api token passed as argument' do
    it 'uses it even if set globally' do
      VCR.use_cassette('my_resource_with_bar_token') do
        client.api_token = 'foo'
        client.base_uri = 'http://default.com'
        client.get(
          '/my_resource', {}, client.default_configuration.with(api_token: 'bar', base_uri: 'http://custom.com')
        )
      end
    end
  end
end
