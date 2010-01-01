class CreateUserContent < ActiveRecord::Migration
  def self.up
    create_table :users_contents, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :content_id, :null => false
      t.date :show_date, :null => false
    end
    
    add_index :users_contents, [:user_id, :content_id], :unique => true
  end

  def self.down
    remove_index :users_contents, :column => [:user_id, :content_id]
    drop_table :users_contents
  end
end
