class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, :null => false
      t.references :product, :null => false
      t.references :details, :null => false

      # Max: 999,999.99
      t.decimal :price, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :product_id
    add_index :line_items, :details_id
  end
end
