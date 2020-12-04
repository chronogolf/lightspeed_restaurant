# frozen_string_literal: true

require 'spec_helper'
require 'lightspeed_restaurant/operations/destroy'

class FakeResource
  include LightspeedRestaurantClient::Operations::Save
  extend LightspeedRestaurantClient::Operations::Create
  extend LightspeedRestaurantClient::Operations::Update
  extend LightspeedRestaurantClient::Operations::Find
  extend LightspeedRestaurantClient::Operations::List
  include LightspeedRestaurantClient::Operations::Destroy

  attr_accessor :id

  def self.default_resource_path
    '/spec'
  end

  def initialize(attributes = {})
    self.id = attributes[:id]
    @attributes = attributes
  end

  def attributes
    { id: id }.merge(@attributes || {})
  end

  def ==(other)
    other.class == self.class && other.attributes == attributes
  end
end

shared_context 'with operation context' do
  let(:custom_configuration) do
    LightspeedRestaurantClient.default_configuration.with(api_token: 'CUSTOM-1234')
  end
end
