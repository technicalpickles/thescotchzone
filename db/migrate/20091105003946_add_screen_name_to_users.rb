class AddScreenNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :screen_name, :string
  end

  def self.down
    remove_column :users, :screen_name
  end
end
