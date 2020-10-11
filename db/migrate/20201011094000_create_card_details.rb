class CreateCardDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :card_details do |t|
      t.integer :cust_id
      t.string :card_number
      t.string :expiry_date
      t.string :cvc_code
      t.string :cardholder_name
      t.boolean :status

      t.timestamps
    end
  end
end
