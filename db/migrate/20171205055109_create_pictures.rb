class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :name
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
