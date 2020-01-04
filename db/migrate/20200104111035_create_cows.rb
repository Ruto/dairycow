class CreateCows < ActiveRecord::Migration[6.0]
  def change
    create_table :cows do |t|
      t.string :name, null: false
      t.date :dob
      t.string :breed
      t.boolean :female, default: true
      t.integer :created_by
      t.references :dairy, null: false, foreign_key: true
      t.integer :birth_by, null: true
      t.integer :photo_id, null: true
      t.boolean :active, default: true
      t.text :deactivation_reason

      t.timestamps
    end
    add_index :cows, :created_by
    add_index :cows, :birth_by
    add_index :cows, :photo_id
  end
end
