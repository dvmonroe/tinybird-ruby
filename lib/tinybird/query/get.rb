# frozen_string_literal: true

module Tinybird
  module Query
    class Get
      include Tinybird::Callable
      include Tinybird::Requestable

      requestable method: :get

      ALLOWED_FORMATS = %w[CSV CSVWithoutHeader CSVWithNames JSON TSV TSVWithoutHeader TSVWithNames PrettyCompact JSONEachRow Parquet].freeze

      attr_reader :sql, :format, :headers

      def initialize(sql: "", format: "JSON", headers: {})
        @sql = sql
        @format = format
        @headers = headers
        validate_format!
      end

      private

      def path_segment
        "v0/sql?q=#{formatted_sql}"
      end

      def body
        nil
      end

      def formatted_sql
        "#{sql} FORMAT #{format}"
      end

      def validate_format!
        raise InvalidFormatError, "Invalid format: #{format}. Supported formats are: #{ALLOWED_FORMATS.join(", ")}" unless ALLOWED_FORMATS.include?(format)
      end
    end
  end
end
