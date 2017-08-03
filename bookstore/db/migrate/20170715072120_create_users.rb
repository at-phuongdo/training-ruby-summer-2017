class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :password_confirm
      t.string :name
      t.integer :gender
      t.datetime :birthday
      t.integer :role, default: 0
      t.string :image
      t.string :provider
      t.string :uid
      t.string :confirm_token
      t.datetime :confirm_token_send
      t.datetime :confirm_token_at
      t.string :reset_password_token
      t.timestamps
    end
  end
end
