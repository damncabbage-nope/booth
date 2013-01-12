class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.text :tagline
      t.text :description
      t.datetime :sales_opened_at, :null => false
      t.datetime :sales_closed_at, :null => false
      t.datetime :began_at, :null => false
      t.datetime :finished_at, :null => false

      t.timestamps
    end
  end
end
