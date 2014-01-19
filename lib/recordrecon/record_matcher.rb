module RecordRecon
  class RecordMatcher
    def self.match path
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet

      new.match(true).each_with_index do |result, i|
        sheet.row(i).concat result
      end

      book.write path
    end

    def match header = false
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
      results << output_header if header

      records.each do |key, record|
        if targets.has_key? key
          results << [record.to_a, targets[key].to_a].flatten
        end
      end

      results
    end

    private
      def output_header
        header = []
        header << 'target_name'
        header << 'target_category'
        header << 'target_created_at'
        header << 'target_count'
        header << 'source_name'
        header << 'source_category'
        header << 'source_created_at'
        header << 'source_count'
        header << 'tag'
        header << 'tagged_at'
        header << 'name'
        header << 'enterd_at'
        header << 'clearing'
        header << 'allocated_at'
        header << 'processed_at'

        header
      end
  end
end
