class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.integer :country
      t.integer :state
      t.integer :city
      t.string :pincode
      t.boolean :status

      t.timestamps
    end
  end
end
