class ChangeUserContentTableName < ActiveRecord::Migration
  def self.up
    create_table :contents_users, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :content_id, :null => false
      t.date :show_date, :null => false
    end
    
    add_index :contents_users, [:user_id, :content_id], :unique => true
  end

  def self.down
    remove_index :contents_users, :column => [:user_id, :content_id]
    drop_table :contents_users
  end
end
