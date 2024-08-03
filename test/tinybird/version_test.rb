# frozen_string_literal: true

require "test_helper"

describe Tinybird::VERSION do
  subject { Tinybird::VERSION }

  it { refute_nil subject }
end
