class CreateDiscountsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts_products do |t|
      t.integer :discount_id
      t.integer :product_id
      t.boolean :status

      t.timestamps
    end
  end
end
