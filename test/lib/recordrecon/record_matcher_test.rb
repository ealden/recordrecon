require 'test_helper'
require 'recordrecon/record_matcher'

module RecordRecon
  class RecordMatcherTest < ActiveSupport::TestCase
    test 'match' do
      assert_empty RecordMatcher.match
    end
  end
end
