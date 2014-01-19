require 'test_helper'

class TargetTransactionTest < ActiveSupport::TestCase
  test 'to_a' do
    expected = ['1234567890', Date.parse('2014-01-01'), 3, Date.parse('2014-01-06'), Date.parse('2014-01-08')]

    assert_equal expected, target_transactions(:target_transaction1).to_a
  end

  test 'to_a null values' do
    expected = [nil, nil, nil, nil, nil]

    assert_equal expected, TargetTransaction.new.to_a
  end
end
