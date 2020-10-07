class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :state_name
      t.integer :country_id
      t.boolean :status

      t.timestamps
    end
  end
end
