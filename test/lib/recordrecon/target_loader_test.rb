require 'test_helper'
require 'recordrecon/target_loader'

module RecordRecon
  class TargetLoaderTest < ActiveSupport::TestCase
    test 'import' do
      record = ['12345678990', '', '', '2014-01-08', '2014-01-06', '', '', '2014-01-01', 3]

      TargetLoader.new.import record

      assert_equal 1, TargetTransaction.count
    end

    test 'import xls' do
      TargetLoader.import 'test/assets/target_transactions.xls'

      assert_equal 3, TargetTransaction.count
    end
  end
end
