class AddExpiresToUsers < ActiveRecord::Migration
  def up
    add_column :users, :expires, :date, :null => true, :default => nil
  end

  def down
    remove_column :users, :expires
  end
end
