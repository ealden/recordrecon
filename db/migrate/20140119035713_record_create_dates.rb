class RecordCreateDates < ActiveRecord::Migration
  def change
    change_table :records do |t|
      t.date :target_created_at
      t.date :source_created_at
    end
  end
end
