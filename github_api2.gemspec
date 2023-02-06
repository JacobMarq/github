# frozen_string_literal: true

require_relative "lib/github_api2/version"

Gem::Specification.new do |gem|
  gem.name          = "github_api2"
  gem.version       = Github::VERSION
  gem.authors       = ["Jacob Marquez"]
  gem.email         = ["jacobmarq@gmail.com"]
  gem.homepage      = "http://piotrmurach.github.io/github/"
  gem.summary       = "Additional support for Piotr's ruby client for the official GitHub API"
  gem.description   = %q{ Ruby client that supports all of the GitHub API methods. It"s build in a modular way, that is, you can either instantiate the whole api wrapper Github.new or use parts of it e.i. Github::Client::Repos.new if working solely with repositories is your main concern. Intuitive query methods allow you easily call API endpoints. This version of github_api is intended to provide support for Oauth 2.x. }
  gem.license       = "MIT"
  gem.required_ruby_version = ">= 2.0.0"
  gem.metadata = {
    "source_code_uri" => "https://github.com/JacobMarq/github_api2"
  }

  gem.files = Dir["lib/**/*"]
  gem.require_paths = %w[ lib ]
  gem.extra_rdoc_files = ["LICENSE.txt", "README.md", "CHANGELOG.md"]

  gem.add_dependency "addressable", "~> 2.4"
  gem.add_dependency "hashie",      ">= 3.5.2"
  gem.add_dependency "faraday",     ">= 0.8", "< 2.0"
  gem.add_dependency 'faraday_middleware', '1.2.0'
  gem.add_dependency "oauth2",      "< 3.0"
  gem.add_dependency "descendants_tracker", "~> 0.0.4"

  gem.add_development_dependency "bundler",  ">= 1.5.0"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "cucumber", "~> 2.1"
  gem.add_development_dependency "rspec",    "~> 3"
  gem.add_development_dependency "rspec-its","~> 1"
  gem.add_development_dependency "vcr",      "~> 3.0.3"
  gem.add_development_dependency "webmock",  "~> 3.8"
end
