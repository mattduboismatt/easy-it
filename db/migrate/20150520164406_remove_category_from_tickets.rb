class RemoveCategoryFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :category_id, :integer
  end
end
