# frozen_string_literal: true

require "tinybird/query/get"

module Tinybird
  module Query
    class << self
      def get(sql: "", format: "JSON", headers: {})
        Get.call(sql: sql, format: format, headers: headers)
      end
    end

    private_constant :Get
  end
end
