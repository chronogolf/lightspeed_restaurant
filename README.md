[![Circle CI](https://circleci.com/gh/chronogolf/lightspeed_restaurant.svg?style=shield&circle-token=94ebc6c7495f5c0bbf9f6a89526395306f223b7e)](https://circleci.com/gh/chronogolf/lightspeed_restaurant) [![Dependency Status](https://gemnasium.com/97099eaf969214667ab4e212a1a4c7fe.svg)](https://gemnasium.com/chronogolf/lightspeed_restaurant)

# Lightspeed Restaurant API Client

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
LightspeedRestaurant.api_token = "YOUR_API_TOKEN_HERE"
```
Next, make requests using the resource class you need:
```ruby
customers = LightspeedRestaurant::Customer.all
customer  = customers.first
customer.firstName = 'Micheal'
customer.save
```
That's it!

### Available operations

#### List

```ruby
LightspeedRestaurant::Customer.all
```

#### Find
```ruby
LightspeedRestaurant::Customer.find(123)
```

#### Create
```ruby
LightspeedRestaurant::Customer.create(...firstName: 'Tom', email: 'tom@brady.com'...)
```

#### Update
```ruby
customer = LightspeedRestaurant::Customer.find(123)
customer.firstName = 'Micheal'
customer.save
```

#### Destroy
```ruby
customer = LightspeedRestaurant::Customer.find(123)
customer.desroy
```

## TODO
- Improve update operation to handle update by passing a hash
- Improve destroy operation to handle destroy by passing an ID (or an array of IDs)
- Add missing resources (Company, Reservation, Floor, Table...)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chronogolf/lightspeed_restaurant.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

