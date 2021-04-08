# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::Create do
    include_context 'operation context'

    it 'supports custom configuration' do
      expect(LightspeedRestaurantClient).to receive(:post).with('/spec', { foo: :bar }, {},
                                                                custom_configuration).and_return({}.to_json)
      FakeResource.create({ foo: :bar }, custom_configuration)
    end
  end
end
