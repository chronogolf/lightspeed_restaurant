# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::Destroy do
    include_context 'with operation context'

    it 'supports custom configuration' do
      resource = FakeResource.new(id: 'Z51')
      allow(LightspeedRestaurantClient).to(
        receive(:delete).with('/spec/Z51', {}, custom_configuration).and_return({}.to_json)
      )
      resource.destroy(custom_configuration)
    end
  end
end
