class CreatePaytmDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :paytm_details do |t|
      t.string :phone_number
      t.integer :cust_id
      t.boolean :status

      t.timestamps
    end
  end
end
