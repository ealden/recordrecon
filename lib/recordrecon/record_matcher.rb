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
      records = Record.to_hash
      targets = TargetTransaction.to_hash

      results = []
      results << output_header if header

      records.each do |key, record|
        target = TargetTransaction.new.to_a
        target = targets[key] if targets.has_key?(key)

        results << [record.to_a, target.to_a].flatten
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
        header << 'notes'
        header << 'name'
        header << 'entered_at'
        header << 'clearing'
        header << 'allocated_at'
        header << 'processed_at'

        header
      end
  end
end
