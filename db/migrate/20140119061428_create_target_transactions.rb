class CreateTargetTransactions < ActiveRecord::Migration
  def change
    create_table :target_transactions do |t|
      t.string :name
      t.date :entered_at
      t.integer :clearing
      t.date :allocated_at
      t.date :processed_at

      t.timestamps
    end
  end
end
