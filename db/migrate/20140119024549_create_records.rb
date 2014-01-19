class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :target_name
      t.string :target_category
      t.integer :target_count
      t.string :source_name
      t.string :source_category
      t.string :source_count
      t.string :tag
      t.date :tagged_at

      t.timestamps
    end
  end
end
