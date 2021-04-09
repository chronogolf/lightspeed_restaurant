# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::Save do
    include_context 'operation context'

    it 'supports custom configuration' do
      resource = FakeResource.new
      resource.id = 'Z51'
      expect(LightspeedRestaurantClient).to receive(:put).with('/spec/Z51', resource, {},
                                                               custom_configuration).and_return({}.to_json)
      resource.save(custom_configuration)
    end
  end
end
