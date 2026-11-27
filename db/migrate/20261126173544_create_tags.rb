class CreateTags < ActiveRecord::Migration[8.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      # 0 = cuisine, 1 = occasion, 2 = vibe, 3 = amenity (ver enum em tag)
      t.integer :category, null: false

      t.timestamps
    end
    add_index :tags, [ :category, :name ], unique: true
  end
end
