module RecordRecon
  class RecordMatcher
    def self.match
      records = Hash.new
      targets = Hash.new

      Record.where(:target_name => nil).each do |record|
        key = {
          :name => record.source_name,
          :processed_at => record.tagged_at
        }

        records[key] = record
      end

      TargetTransaction.all.each do |target|
        key = {
          :name => target.name,
          :processed_at => target.processed_at
        }
        targets[key] = target
      end

      results = []

      records.each do |key, record|
        if targets.has_key? key
          results << [record.to_a, targets[key].to_a].flatten
        end
      end

      results
    end
  end
end
