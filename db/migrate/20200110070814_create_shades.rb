class CreateShades < ActiveRecord::Migration[6.0]
  def change
    create_table :shades do |t|
      t.references :dairy, null: false, foreign_key: true
      t.string :name, null: false
      t.text :desc
      t.integer :capacity, null: false
      t.boolean :active, default: true
      t.integer :created_by, null: false

      t.timestamps
    end
    add_index :shades, :created_by
  end
end
