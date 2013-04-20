class CreateTicketDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :full_name, :null => false

      t.timestamps
    end
  end
end
