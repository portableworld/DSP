class Linkalations < ActiveRecord::Migration
  def self.up
    create_table :linkalations do |t|
      t.integer :user_id
      t.integer :link_id
      t.date :show_date
      t.integer :order
      
      t.timestamps
    end
  end

  def self.down
    drop_table :linkalations
  end
end
