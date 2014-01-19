require 'test_helper'
require 'recordrecon/record_loader'

module RecordRecon
  class RecordLoaderTest < ActiveSupport::TestCase
    test 'import' do
      loader = RecordLoader.new
      record = [ '1234567890', 'ABC', 2, '1234567890', 'ABC', 2, 'GOOD', '2014-01-01' ]

      loader.import record

      assert_equal 1, Record.count
    end
  end
end
