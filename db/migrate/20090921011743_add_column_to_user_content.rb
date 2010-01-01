class AddColumnToUserContent < ActiveRecord::Migration
  def self.up
    add_column :users_contents, :order, :integer
  end

  def self.down
    remove_column :users_contents, :order
  end
end
