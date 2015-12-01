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

require 'lightspeed_restaurant/company'
require 'lightspeed_restaurant/customer'
require 'lightspeed_restaurant/establishment'
require 'lightspeed_restaurant/feature'
require 'lightspeed_restaurant/floor'
require 'lightspeed_restaurant/order'
require 'lightspeed_restaurant/payment_type'
require 'lightspeed_restaurant/product'
require 'lightspeed_restaurant/product_group'
require 'lightspeed_restaurant/receipt'
require 'lightspeed_restaurant/referral'
require 'lightspeed_restaurant/report'
require 'lightspeed_restaurant/reservation'
require 'lightspeed_restaurant/table'
require 'lightspeed_restaurant/tax'
require 'lightspeed_restaurant/ticket'


#
#   Errors
#

require 'lightspeed_restaurant/errors/lightspeed_restaurant_error'
require 'lightspeed_restaurant/errors/api_connection_error'


module LightspeedRestaurant
  # Your code goes here...
end
