class CreateCowShades < ActiveRecord::Migration[6.0]
  def change
    create_table :cow_shades do |t|
      t.references :cow, null: false, foreign_key: true
      t.references :shade, null: false, foreign_key: true
      t.boolean :active, default: true
      t.integer :created_by
      t.integer :deactivated_by

      t.timestamps
    end
    add_index :cow_shades, [:created_by, :deactivated_by]
  end
end
