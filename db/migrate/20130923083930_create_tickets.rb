class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :carrier
      t.integer :price
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
