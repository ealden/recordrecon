require 'test_helper'
require 'recordrecon/record_matcher'

module RecordRecon
  class RecordMatcherTest < ActiveSupport::TestCase
    fixtures :records, :target_transactions

    test 'match' do
      results = RecordMatcher.match

      assert_equal 1, results.count

      result = results[0]
      assert_equal 15, result.count
      assert_equal '1234567891', result[4]
      assert_equal Date.parse('2014-01-08'), result[9]
      assert_equal '1234567891', result[10]
      assert_equal Date.parse('2014-01-08'), result[14]
    end
  end
end
