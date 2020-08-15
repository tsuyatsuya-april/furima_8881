class RenameShipPrepareColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_prepare, :ship_prepare_id
  end
end
