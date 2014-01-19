module RecordRecon
  class TargetLoader
    def import record
      TargetTransaction.create do |t|
        t.name = record[0]
        t.entered_at = record[1]
        t.clearing = record[2]
        t.allocated_at = record[3]
        t.processed_at = record[4]
      end
    end
  end
end
