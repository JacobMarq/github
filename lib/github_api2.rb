# encoding: utf-8

require 'pp' if ENV['DEBUG']

require 'faraday'
require_relative 'github_api2/ext/faraday'

module Github
  LIBNAME = 'github_api2'

  LIBDIR = File.expand_path("../#{LIBNAME}", __FILE__)

  class << self
    # The client configuration
    #
    # @return [Configuration]
    #
    # @api public
    def configuration
      @configuration ||= Configuration.new
    end
    alias_method :config, :configuration

    # Configure options
    #
    # @example
    #   Github.configure do |c|
    #     c.some_option = true
    #   end
    #
    # @yield the configuration block
    # @yieldparam configuration [Github::Configuration]
    #   the configuration instance
    #
    # @return [nil]
    #
    # @api public
    def configure
      yield configuration
    end

    # Alias for Github::Client.new
    #
    # @param [Hash] options
    #   the configuration options
    #
    # @return [Github::Client]
    #
    # @api public
    def new(options = {}, &block)
      Client.new(options, &block)
    end

    # Default middleware stack that uses default adapter as specified
    # by configuration setup
    #
    # @return [Proc]
    #
    # @api private
    def default_middleware(options = {})
      Middleware.default(options)
    end

    # Delegate to Github::Client
    #
    # @api private
    def method_missing(method_name, *args, &block)
      if new.respond_to?(method_name)
        new.send(method_name, *args, &block)
      elsif configuration.respond_to?(method_name)
        Github.configuration.send(method_name, *args, &block)
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      new.respond_to?(method_name, include_private) ||
      configuration.respond_to?(method_name) ||
      super(method_name, include_private)
    end
  end
end # Github

require_relative 'github_api2/api'
require_relative 'github_api2/client'
require_relative 'github_api2/configuration'
require_relative 'github_api2/deprecation'
require_relative 'github_api2/core_ext/array'
require_relative 'github_api2/core_ext/hash'
require_relative 'github_api2/middleware'
require_relative 'github_api2/version'
