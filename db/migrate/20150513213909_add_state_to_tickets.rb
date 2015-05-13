class AddStateToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :state, :integer, default: 0, null: false
  end
end
