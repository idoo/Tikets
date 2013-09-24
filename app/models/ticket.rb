class Ticket < ActiveRecord::Base
  belongs_to :ticketable, polymorphic: true
  has_many   :tickets, as: :ticketable

end
