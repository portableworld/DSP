class UpdateCompilationsWithOrder < ActiveRecord::Migration
  def self.up
    add_column :compilations, :order, :integer
  end

  def self.down
    remove_column :compilations, :order
  end
end
