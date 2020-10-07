class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.string :image
      t.float :over_all_rating
      t.boolean :discount_available
      t.integer :total_quantity
      t.boolean :available
      t.integer :vendor_detail_id

      t.timestamps
    end
  end
end
