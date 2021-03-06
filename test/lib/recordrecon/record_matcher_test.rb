require 'test_helper'
require 'recordrecon/record_matcher'

module RecordRecon
  class RecordMatcherTest < ActiveSupport::TestCase
    fixtures :records, :target_transactions

    test 'match' do
      results = RecordMatcher.new.match

      assert_equal 2, results.count

      assert_equal 16, results[0].count

      result = results[1]
      assert_equal 16, result.count
      assert_equal '1234567891', result[4]
      assert_equal Date.parse('2014-01-08'), result[9]
      assert_equal '1234567891', result[11]
      assert_equal Date.parse('2014-01-08'), result[15]
    end

    test 'export to file' do
      path = 'test/assets/output.xls'

      RecordMatcher.match path

      assert File.exists? path

      sheet = Spreadsheet.open(path).worksheet(0)

      assert_equal 3, sheet.row_count
      assert_equal 16, sheet.column_count

      FileUtils.rm path
    end
  end
end
