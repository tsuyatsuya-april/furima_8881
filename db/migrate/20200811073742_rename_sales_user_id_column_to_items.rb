class RenameSalesUserIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sales_user_id, :user_id
  end
end
