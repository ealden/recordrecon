module RecordRecon
  class RecordLoader
    def import record
      Record.create do |r|
        r.target_name = record[0]
        r.target_category = record[1]
        r.target_count = record[2]
        r.source_name = record[3]
        r.source_category = record[4]
        r.source_count = record[5]
        r.tag = record[6]
        r.tagged_at = record[7]
      end
    end
  end
end
