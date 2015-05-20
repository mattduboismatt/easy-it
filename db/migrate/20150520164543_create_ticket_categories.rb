class CreateTicketCategories < ActiveRecord::Migration
  def change
    create_table :ticket_categories do |t|
        t.belongs_to :ticket
        t.belongs_to :category
    end

    add_index :ticket_categories, :ticket_id
    add_index :ticket_categories, :category_id
  end
end
