class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,          null: false
      t.text :description,     null: false
      t.integer :category,      null: false
      t.integer :state,         null: false
      t.integer :pay_state,     null: false
      t.integer :ship_origin_prefecture,    null: false
      t.integer :ship_prepare,  null: false
      t.integer :price,         null: false
      t.integer :sales_user_id, null: false
      t.timestamps
    end
  end
end
