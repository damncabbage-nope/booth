class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      # Email is nullable in certain conditions; leave conditional
      # validation to the model.
      t.string :email

      t.timestamps
    end
    add_index :customers, :email
  end
end
