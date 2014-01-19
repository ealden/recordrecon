class RecordSourceCountShouldBeInteger < ActiveRecord::Migration
  def change
    rename_column :records, :source_count, :source_count_old
    add_column :records, :source_count, :integer

    Record.all.each do |record|
      record.source_count = record.source_count_old
      record.save
    end

    remove_column :records, :source_count_old
  end
end
