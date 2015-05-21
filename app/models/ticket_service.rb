class TicketService < ActiveRecord::Base
  belongs_to :ticket 
  belongs_to :service
end