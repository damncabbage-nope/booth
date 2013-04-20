class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product
      t.references :details

      # Max: 999,999.99
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
