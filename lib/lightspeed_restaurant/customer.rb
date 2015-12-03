require 'lightspeed_restaurant/base'

module LightspeedRestaurant
  class Customer < LightspeedRestaurant::Base
    attr_accessor :id,
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
                  :links

    def full_name
      "#{firstName} #{lastName}"
    end
  end
end
