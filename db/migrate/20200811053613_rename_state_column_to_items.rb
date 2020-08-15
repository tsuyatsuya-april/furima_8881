class RenameStateColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :state, :state_id
  end
end
