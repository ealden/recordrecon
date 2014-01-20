require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test 'to_a' do
    expected = ['1234567890', 'ABC', Date.parse('2014-01-01'), 1, '1234567890', 'ABC', Date.parse('2014-01-01'), 1, nil, nil, nil]

    assert_equal expected, records(:record1).to_a
  end

  test 'to_a null handling' do
    expected = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]

    assert_equal expected, Record.new.to_a
  end

  test 'should return hash with source_name and tagged_at as key' do
    records = Record.to_hash

    assert_equal 2, records.count

    record2 = records(:record2)

    assert_equal record2, records[{ :name => record2.source_name, :processed_at => record2.tagged_at }]
  end

  test 'should return key with source_name and tagged_at as fields' do
    key = { :name => '1234567891', :processed_at => Date.parse('2014-01-08') }

    assert_equal key, records(:record2).to_key
  end
end
