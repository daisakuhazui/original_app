class CreateGenreUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :genre_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
