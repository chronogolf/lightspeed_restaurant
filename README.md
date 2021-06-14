# Lightspeed Restaurant API Client

[![Code Climate](https://codeclimate.com/github/chronogolf/lightspeed_restaurant/badges/gpa.svg)](https://codeclimate.com/github/chronogolf/lightspeed_restaurant) [![Gem Version](https://badge.fury.io/rb/lightspeed_restaurant.svg)](https://badge.fury.io/rb/lightspeed_restaurant)

[Lightspeed Restaurant API Client](https://github.com/chronogolf/lightspeed_restaurant) is a gem for interacting with [Lightspeed Restaurant](https://www.lightspeedhq.com/products/restaurant/) API.
Lightspeed Restaurant is point of sale that helps bars, restaurants, and cafés deliver a better customer experience and run a more profitable business.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lightspeed_restaurant'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lightspeed_restaurant

## Usage

### Basic Usage

First, set your api token:
```ruby
LightspeedRestaurantClient.api_token = "YOUR_API_TOKEN_HERE"
```
Next, make requests using the resource class you need:
```ruby
customers = LightspeedRestaurantClient::Customer.all
customer  = customers.first
customer.firstName = 'Tom'
customer.save
```
That's it!

### Using a custom API configuration per action
Each action support a configuration object as the last param, allows you to setup `api_token`, `base_uri`
Sample usage:
```ruby
LightspeedRestaurantClient::Customer.all(LightspeedRestaurantClient.default_configuration.with(api_token: 'MY_OTHER_TOKEN', base_uri: 'other_ls_resto_uri'))
```

### Available operations

#### List

```ruby
LightspeedRestaurantClient::Customer.all
```

#### Find
```ruby
LightspeedRestaurantClient::Customer.find(123)
```

#### Create
```ruby
LightspeedRestaurantClient::Customer.create(...firstName: 'Tom', email: 'tom@brady.com'...)
```

#### Update
```ruby
LightspeedRestaurantClient::Customer.update(123, { email: 'tom@brady.com' })
```

#### Save
```ruby
customer = LightspeedRestaurantClient::Customer.find(123)
customer.firstName = 'Micheal'
customer.save
```

#### Destroy
```ruby
customer = LightspeedRestaurantClient::Customer.find(123)
customer.destroy
```

### Logs

By default the logs are done on STDOUT.
You can specify your own logger (it has to respond to info and error methods, like the Rails logger) :
```ruby
LightspeedRestaurantClient.logger = "YOUR_LOGGER"
```

## Contributing

Pull requests are welcome on GitHub at https://github.com/chronogolf/lightspeed_restaurant.

## About Us
[![Chronogolf by Lightspeed][crest]](https://www.chronogolf.com)

[Chronogolf](https://www.chronogolf.com)'s mission is to facilitate the interactions between golf managers and golf players. We are building software that allows golf directors to better manage their course, together with a marketplace to find & book games in real-time. We are constantly innovating and trying to challenge the status quo.

Find more informations at https://pro.chronogolf.com

## Future Improvements
- Improve destroy operation to handle destroy by passing an ID (or an array of IDs)
- Add missing resources (Company, Reservation, Floor, Table...)
- Improve test coverage

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[crest]: ./logo.png
