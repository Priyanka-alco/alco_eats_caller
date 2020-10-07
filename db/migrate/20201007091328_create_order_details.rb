class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :sku_id
      t.integer :quantity
      t.integer :discount_id
      t.integer :selling_price
      t.integer :status

      t.timestamps
    end
  end
end
