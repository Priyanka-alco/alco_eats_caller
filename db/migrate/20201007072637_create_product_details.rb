class CreateProductDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :product_details do |t|
      t.integer :product_id
      t.integer :sku
      t.integer :category
      t.float :selling_rice
      t.float :cost_price
      t.float :gst
      t.integer :discount_id
      t.float :discount_amount
      t.float :discount_percentage
      t.integer :quantity
      t.boolean :exchange_available
      t.boolean :replace
      t.boolean :status
      t.date :delivery_date

      t.timestamps
    end
  end
end
