# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::List do
    include_context 'operation context'

    it 'supports custom configuration' do
      expect(LightspeedRestaurantClient).to receive(:get).with('/spec', { name: 'foo' },
                                                               custom_configuration).and_return([].to_json)
      FakeResource.list({ name: 'foo' }, custom_configuration)
    end
  end
end
