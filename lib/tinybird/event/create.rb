# lib/tinybird/event/create.rb

module Tinybird
  module Event
    class Create
      include Tinybird::Callable
      include Tinybird::Requestable

      requestable method: :post

      attr_reader :data, :event_name, :wait, :headers

      def initialize(data, event_name:, wait: false, headers: {})
        @data = data
        @event_name = event_name
        @wait = wait
        @headers = headers
      end

      private

      def path_segment
        "v0/events?name=#{event_name}&wait=#{wait}"
      end

      def body
        data
      end
    end
  end
end
