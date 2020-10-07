class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :discount_code
      t.integer :no_of_coupon
      t.date :valid_from
      t.date :valid_to
      t.float :minimum_order_value
      t.float :discount_amount
      t.boolean :auto_apply
      t.boolean :status

      t.timestamps
    end
  end
end
