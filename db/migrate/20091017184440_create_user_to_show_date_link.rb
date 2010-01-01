class CreateUserToShowDateLink < ActiveRecord::Migration
  def self.up
    create_table :showDate_link do |t|
      t.date :show_date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :showDate_link
  end
end
