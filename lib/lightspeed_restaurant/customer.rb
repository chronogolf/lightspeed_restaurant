require 'lightspeed_restaurant/base'

module LightspeedRestaurant
  class Customer < LightspeedRestaurant::Base
    def self.attributes
      [:id,
       :city,
       :country,
       :deliveryCity,
       :deliveryCountry,
       :deliveryStreet,
       :deliveryStreetNumber,
       :deliveryZip,
       :email,
       :firstName,
       :lastName,
       :street,
       :streetNumber,
       :telephone,
       :zip,
       :links].freeze
    end

    attr_accessor(*attributes)
  end
end
