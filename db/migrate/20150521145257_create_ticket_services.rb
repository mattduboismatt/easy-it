class CreateTicketServices < ActiveRecord::Migration
  def change
    create_table :ticket_services do |t|
        t.belongs_to :ticket
        t.belongs_to :service
    end

    add_index :ticket_services, :ticket_id
    add_index :ticket_services, :service_id
  end
end
