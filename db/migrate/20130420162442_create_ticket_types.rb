class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :event
      t.string :name, :null => false

      # Max: 999,999.99
      t.decimal :price, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
    add_index :products, :event_id
  end
end
