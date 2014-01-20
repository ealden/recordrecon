class Record < ActiveRecord::Base
  def self.to_hash
    records = Hash.new

    all.each do |record|
      key = {
        :name => record.source_name,
        :processed_at => record.tagged_at
      }

      records[key] = record
    end

    records
  end

  def to_a
    record = []
    record << target_name
    record << target_category
    record << target_created_at
    record << target_count
    record << source_name
    record << source_category
    record << source_created_at
    record << source_count
    record << tag
    record << tagged_at
    record << notes

    record
  end
end
