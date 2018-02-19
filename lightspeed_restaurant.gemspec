lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lightspeed_restaurant/version'

Gem::Specification.new do |spec|
  spec.name          = 'lightspeed_restaurant'
  spec.version       = LightspeedRestaurantClient::VERSION
  spec.authors       = ['Olivier Buffon']
  spec.email         = ['olivier@chronogolf.ca']

  spec.summary       = 'Ruby bindings for the Lightspeed Restaurant API'
  spec.description   = 'Lightspeed Restaurant is point of sale that helps bars, restaurants, '\
                       'and cafés deliver a better customer experience and run a more profitable business. '\
                       'See https://www.lightspeedhq.com/products/restaurant/ for details'
  spec.homepage      = 'https://github.com/chronogolf/lightspeed_restaurant'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('excon', '~> 0.45.4')
  spec.add_dependency('json', '~> 1.8.3')

  spec.add_development_dependency('bundler-audit')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('vcr')
  spec.add_development_dependency('webmock')
end
