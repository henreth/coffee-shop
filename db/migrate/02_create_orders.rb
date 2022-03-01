class CreateOrders < ActiveRecord::Migration[5.2]
    def change
      create_table :orders do |t| 
        t.integer :price
        t.integer :customer_id
        t.integer :coffee_id
      end
    end
  end
  