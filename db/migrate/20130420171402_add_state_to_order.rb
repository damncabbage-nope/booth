class AddStateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string, :default => 'new', :null => false
  end
end
