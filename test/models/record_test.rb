require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test 'to_a' do
    expected = ['1234567890', 'ABC', Date.parse('2014-01-01'), 1, '1234567890', 'ABC', Date.parse('2014-01-01'), 1, nil, nil]

    assert_equal expected, records(:record1).to_a
  end

  test 'to_a null handling' do
    expected = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]

    assert_equal expected, Record.new.to_a
  end
end
