module RecordRecon
  class TargetLoader
    def self.import records
      loader = TargetLoader.new

      Spreadsheet.open(records).worksheet(0).each_with_index do |record, i|
        next if i == 0

        loader.import record
      end
    end

    def import record
      TargetTransaction.create do |t|
        t.name = record[0]
        t.entered_at = record[7]
        t.clearing = record[8]
        t.allocated_at = record[4]
        t.processed_at = record[3]
      end
    end
  end
end
