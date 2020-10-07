class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :cust_id
      t.float :total
      t.integer :discount_id
      t.integer :seller_id
      t.integer :status

      t.timestamps
    end
  end
end
