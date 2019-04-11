# frozen_string_literal: true

require 'spec_helper'
require 'lightspeed_restaurant/operations/destroy'

shared_context 'operation context' do
  class FakeResource
    include LightspeedRestaurantClient::Operations::Save
    extend LightspeedRestaurantClient::Operations::Create
    extend LightspeedRestaurantClient::Operations::Update
    extend LightspeedRestaurantClient::Operations::Find
    extend LightspeedRestaurantClient::Operations::List
    include LightspeedRestaurantClient::Operations::Destroy

    attr_accessor :id

    def self.resource_path
      '/spec'
    end

    def initialize(attributes = {})
      self.id = attributes[:id]
      @attributes = attributes
    end

    def attributes
      { id: id }.merge(@attributes || {})
    end

    def ==(value)
      value.class == self.class && value.attributes == attributes
    end
  end

  def custom_configuration
    @config ||= LightspeedRestaurantClient.default_configuration.with(api_token: 'CUSTOM-1234')
  end
end
