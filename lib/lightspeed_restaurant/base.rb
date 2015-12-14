module LightspeedRestaurant
  class Base
    def initialize(data = {})
      self.class.attributes.each do |attribute|
        data  = data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
        value = ['Missing', 'N/A', ''].include?(data[attribute]) ? nil : data[attribute]
        send("#{attribute}=", value)
      end
    end

    def to_hash
      self.class.attributes.each_with_object({}) do |attribute, h|
        h[attribute] = instance_variable_get("@#{attribute}")
      end
    end

    def to_json
      to_hash.to_json
    end
  end
end
