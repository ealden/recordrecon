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

  test 'monday entry should clear on thursday with 3 day clearing' do
    assert_equal '2014-01-09', get_clearing_date('2014-01-06', 3)
  end

  test 'tuesday entry should clear on friday with 3 day clearing' do
    assert_equal '2014-01-10', get_clearing_date('2014-01-07', 3)
  end

  test 'wednesday entry should clear on monday the week after with 3 day clearing' do
    assert_equal '2014-01-13', get_clearing_date('2014-01-08', 3)
  end

  test 'thursday entry should clear on tuesday the week after with 3 day clearing' do
    assert_equal '2014-01-14', get_clearing_date('2014-01-09', 3)
  end

  test 'friday entry should clear on wednesday the week after with 3 day clearing' do
    assert_equal '2014-01-15', get_clearing_date('2014-01-10', 3)
  end

  test 'monday entry should clear on wednesday the week after with 7 day clearing' do
    assert_equal '2014-01-15', get_clearing_date('2014-01-06', 7)
  end

  test 'tuesday entry should clear on thursday the week after with 7 day clearing' do
    assert_equal '2014-01-16', get_clearing_date('2014-01-07', 7)
  end

  test 'wednesday entry should clear on friday the week after with 7 day clearing' do
    assert_equal '2014-01-17', get_clearing_date('2014-01-08', 7)
  end

  private

    def get_clearing_date entered_at, clearing
      target = TargetTransaction.new
      target.entered_at = Date.parse(entered_at)
      target.clearing = clearing

      target.cleared_at.strftime '%F'
    end
end
