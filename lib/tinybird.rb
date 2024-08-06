# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

require "tinybird/version"
require "tinybird/configuration"
require "tinybird/http_client"
require "tinybird/response"

require "tinybird/callable"
require "tinybird/requestable"

require "tinybird/query"
module Tinybird
  class Error < StandardError; end

  class InvalidFormatError < Error; end
end
