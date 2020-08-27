class AddTokenToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :token, :string
    add_index :purchases, :token, unique: true
  end
end
