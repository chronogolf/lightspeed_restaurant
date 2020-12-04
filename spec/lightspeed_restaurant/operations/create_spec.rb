# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::Create do
    include_context 'with operation context'

    it 'supports custom configuration' do
      allow(LightspeedRestaurantClient).to(
        receive(:post).with('/spec', { a: :b }, {}, custom_configuration).and_return({}.to_json)
      )
      FakeResource.create({ a: :b }, custom_configuration)
    end
  end
end
