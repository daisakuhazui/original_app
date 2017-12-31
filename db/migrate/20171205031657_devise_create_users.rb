class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false # 後からdefaultオプションを追加する
      t.string :encrypted_password, null: false

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string :alias_name, null: false
      t.string :name, null: false
      t.text :profile_image # 後からdefaultオプションを追加する
      t.text :cover_image # 後からdefaultオプションを追加する
      t.string :area
      t.text :introduce

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :alias_name
    add_index :users, :name
  end
end
