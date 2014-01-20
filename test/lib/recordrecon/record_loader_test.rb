require 'test_helper'
require 'recordrecon/record_loader'

module RecordRecon
  class RecordLoaderTest < ActiveSupport::TestCase
    setup do
      Record.destroy_all
    end

    test 'import' do
      record = [ '1234567890', 'ABC', '2014-01-01', 2, '1234567890', 'ABC', '2014-01-01', 2, 'GOOD', '2014-01-01' ]

      RecordLoader.new.import record

      assert_equal 1, Record.count
    end

    test 'import xls' do
      RecordLoader.import 'test/assets/records.xls'

      assert_equal 6, Record.count
    end

    test 'import with notes' do
      record = [ '1234567890', 'ABC', '2014-01-01', 2, '1234567890', 'ABC', '2014-01-01', 2, 'GOOD', '2014-01-01' ]

      RecordLoader.new.import record, 'Notes'

      assert_equal 1, Record.count
      assert_equal 'Notes', Record.all[0].notes
    end

    test 'import xls with notes' do
      RecordLoader.import 'test/assets/records.xls', 'Notes'

      assert_equal 6, Record.count

      (0..5).each do |i|
        assert_equal 'Notes', Record.all[i].notes
      end
    end
  end
end
