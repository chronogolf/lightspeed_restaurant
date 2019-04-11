# frozen_string_literal: true

require 'spec_helper'
require_relative 'operation_context'

module LightspeedRestaurantClient
  describe Operations::Find do
    include_context 'operation context'

    it 'supports custom configuration' do
      expect(LightspeedRestaurantClient).to receive(:get).with('/spec/Z51', {}, custom_configuration).and_return({}.to_json)
      FakeResource.find('Z51', custom_configuration)
    end
  end
end
