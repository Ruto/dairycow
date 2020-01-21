class CreateMilkings < ActiveRecord::Migration[6.0]
  def change
    create_table :milkings do |t|
      t.references :cow, null: false, foreign_key: true
      t.string :type
      t.references :milking_time, null: true, foreign_key: true
      t.float :quantity
      t.datetime :milking_datetime
      t.integer :milked_by
      t.integer :confirmed_by
      t.integer :user_id

      t.timestamps
    end
    add_index :milkings, [ :milked_by, :confirmed_by, :user_id ]
  end
end
