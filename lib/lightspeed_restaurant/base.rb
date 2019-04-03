# frozen_string_literal: true

module LightspeedRestaurantClient
  class Base
    def initialize(data = {})
      convert_to_obj(data)
    end

    def attributes
      instance_variables.each_with_object({}) do |instance_variable, h|
        h[instance_variable[1..instance_variable.length]] = instance_variable_get(instance_variable)
      end
    end

    def to_json(_opts)
      attributes.to_json
    end

    private

    def convert_to_obj(hash)
      hash.each do |key, value|
        self.class.send(:attr_accessor, key)
        instance_variable_set("@#{key}", value)
        convert_to_obj(value) if value.is_a? Hash
      end
    end
  end
end
