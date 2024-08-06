# frozen_string_literal: true

require "tinybird/event/create"

module Tinybird
  module Event
    class << self
      def create(data, event_name:, wait: false, headers: {})
        Create.call(data, event_name: event_name, wait: wait, headers: headers)
      end
    end

    private_constant :Create
  end
end
