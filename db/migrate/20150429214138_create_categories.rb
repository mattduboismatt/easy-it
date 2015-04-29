class CreateCategories < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.string :name, null: false
      t.references :parent

      t.timestamps
    end

    add_column :tickets, :category_id, :integer, references: :category, null: false
    add_index :tickets, :category_id
  end
end
