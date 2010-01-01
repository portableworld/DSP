class CreateShowdateLinks < ActiveRecord::Migration
  def self.up
    create_table :showdate_links, :id => false do |t|
      t.date :showdate
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :showdate_links
  end
end
