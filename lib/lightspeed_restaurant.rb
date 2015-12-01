#   Lightspeed Restaurant Ruby Bindings
#   API spec at http://staging-exact-integration.posios.com/PosServer/swagger-ui.html

require 'rest-client'
require 'json'


#
#   Version
#

require 'lightspeed_restaurant/version'


#
#   Resources
#

require 'lightspeed_restaurant/account'
require 'lightspeed_restaurant/authentication'
require 'lightspeed_restaurant/core'
require 'lightspeed_restaurant/financial'
require 'lightspeed_restaurant/inventory'
require 'lightspeed_restaurant/online_order'
require 'lightspeed_restaurant/registration'
require 'lightspeed_restaurant/reservation'


#
#   Errors
#

require 'lightspeed_restaurant/errors/lightspeed_restaurant_error'
require 'lightspeed_restaurant/errors/api_connection_error'


module LightspeedRestaurant
  # Your code goes here...
end
