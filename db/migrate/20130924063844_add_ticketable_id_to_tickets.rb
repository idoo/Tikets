class AddTicketableIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticketable_id, :integer

    add_index :tickets, :ticketable_id
  end
end
