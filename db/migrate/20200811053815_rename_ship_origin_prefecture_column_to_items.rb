class RenameShipOriginPrefectureColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_origin_prefecture, :ship_origin_prefecture_id
  end
end
