module APIConnection
  def setup_api_token
    LightspeedRestaurant.api_token = 'API_TOKEN_VALUE'
  end
end

RSpec.configure do |c|
  c.extend APIConnection
end
