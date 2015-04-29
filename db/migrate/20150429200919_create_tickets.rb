class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
