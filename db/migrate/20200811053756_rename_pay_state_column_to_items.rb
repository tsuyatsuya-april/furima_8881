class RenamePayStateColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :pay_state, :pay_state_id
  end
end
