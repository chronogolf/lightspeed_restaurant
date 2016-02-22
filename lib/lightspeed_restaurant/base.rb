module LightspeedRestaurant
  class Base
    def initialize(data = {})
      self.class.attributes.each do |attribute|
        data  = data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
        value = ['Missing', 'N/A', ''].include?(data[attribute]) ? nil : data[attribute]
        send("#{attribute}=", value)
      end
    end

    def attributes
      self.instance_variables.each_with_object({}) do |instance_variable, h|
        h[instance_variable[1..instance_variable.length]] = instance_variable_get(instance_variable)
      end
    end

    def to_json
      to_hash.to_json
    end
  end
end
