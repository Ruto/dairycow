class CreateCowDairies < ActiveRecord::Migration[6.0]
  def change
    create_table :cow_dairies do |t|
      t.references :cow, null: false, foreign_key: true
      t.references :dairy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :active, default: true
    # t.string :transfer_key, null: true 

      t.timestamps
    end
  end
end
