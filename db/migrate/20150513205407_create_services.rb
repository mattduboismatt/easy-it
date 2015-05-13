class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
        t.string :name, null: false
    end

    add_index :categories, :service_id
  end
end
