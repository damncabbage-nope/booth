class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      # Email is nullable in certain conditions; leave conditional
      # validation to the model.
      t.string :email
      t.string :token, :null => false

      t.timestamps
    end
    add_index :customers, :token, :unique => true
  end
end
