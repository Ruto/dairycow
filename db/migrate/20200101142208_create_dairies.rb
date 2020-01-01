class CreateDairies < ActiveRecord::Migration[6.0]
  def change
    create_table :dairies do |t|
      t.string  :name,    null: false
      t.text    :desc,    null: false
      t.integer :user_id
      t.boolean :active, default: true
      t.string  :country
      t.string  :county
      t.integer :geolocation_id

      t.timestamps
    end
    add_index :dairies, :name,  unique: true
    add_index :dairies, :user_id
    add_index :dairies, :geolocation_id
  end
end
