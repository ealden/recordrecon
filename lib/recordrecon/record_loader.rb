module RecordRecon
  class RecordLoader
    def self.import records, notes = ''
      loader = RecordLoader.new

      Spreadsheet.open(records).worksheet(0).each_with_index do |row, i|
        next if i == 0

        loader.import row, notes
      end
    end

    def import record, notes = ''
      Record.create do |r|
        r.target_name = record[0]
        r.target_category = record[1]
        r.target_created_at = record[2]
        r.target_count = record[3]
        r.source_name = record[4]
        r.source_category = record[5]
        r.source_created_at = record[6]
        r.source_count = record[7]
        r.tag = record[8]
        r.tagged_at = record[9]
        r.notes = notes
      end
    end
  end
end
