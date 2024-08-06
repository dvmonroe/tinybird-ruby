# lib/tinybird/configuration.rb

module Tinybird
  class Configuration
    attr_accessor :auth_token, :base_url

    def initialize
      @auth_token = ENV.fetch("TINYBIRD_AUTH_TOKEN", nil)
      @base_url = ENV.fetch("TINYBIRD_BASE_URL", "https://api.tinybird.co/v0")
    end
  end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    alias_method :config, :configuration

    def configure
      yield configuration
    end
  end
end
