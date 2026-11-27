class CreateRestaurants < ActiveRecord::Migration[8.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.references :city, null: false, foreign_key: true
      t.string :neighborhood
      t.string :address
      # 1 a 4 ($ a $$$$). Nulo deixa o restaurante fora da busca(RN-E05).
      t.integer :price_range
      # 0 = pending, 1 = approved, 2 = rejected (ver enum em Restaurant)
      t.integer :status, null: false, default: 0
      t.datetime :approved_at
      t.decimal :average_rating, precision: 2, scale: 1, null: false, default: 0.0

      t.timestamps
    end

    add_index :restaurants, :status
  end
end
