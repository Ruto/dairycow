class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :username
      t.string :phone
      t.string :email
      t.string :phone_token
      t.string :email_token
      t.references :dairy, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.integer :inviter
      t.integer :invitation_role
      t.boolean :confirmed_by_phone
      t.datetime :phone_confirmed_time
      t.boolean :confirmed_by_email
      t.datetime :email_confirmed_time
      t.datetime :admin_confirmed_at
      t.boolean :admin_confirmed
      t.integer :admin_confirmed_by
      t.boolean :revoked_invite, default: false

      t.timestamps
    end
    add_index :invitations, :phone_token, unique: true
    add_index :invitations, :email_token, unique: true
    add_index :invitations, :inviter
    add_index :invitations, :invitation_role
  end
end
