class CreateMilkingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :milking_times do |t|
      t.string :milking_timeable_id
      t.string :milking_timeable_type
      t.time :first_milking
      t.time :second_milking
      t.time :third_milking
      t.time :fourth_milking
      t.integer :milking_count
      t.boolean :active, default: true
      t.integer :created_by
      t.integer :deactivated_by

      t.timestamps
    end
    add_index :milking_times, [:created_by, :deactivated_by]
  end
end
