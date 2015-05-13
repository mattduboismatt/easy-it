class RemoveParentFromCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :parent_id, :service_id
  end
end
