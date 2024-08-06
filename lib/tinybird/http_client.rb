# frozen_string_literal: true

module Tinybird
  class HttpClient
    attr_reader :uri

    def initialize(uri)
      @uri = uri
    end

    def get(headers = {})
      request = Net::HTTP::Get.new(uri, headers)
      make_request(request)
    end

    def post(body, headers = {})
      request = Net::HTTP::Post.new(uri, headers)
      request.body = body.to_json
      make_request(request)
    end

    private

    def make_request(request)
      request["Authorization"] = "Bearer #{Tinybird.config.auth_token}"
      request["User-Agent"] = "tinybird-ruby/#{Tinybird::VERSION}"

      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
        http.request(request).then do |response|
          Response.new(response)
        end
      end
    end
  end
end
