module LightspeedRestaurant
  class Base
    def initialize(data = {})
      data.each do |k, v|
        v = nil if ['N/A', ''].include?(v)
        send("#{k}=", v)
      end
    end
  end
end
