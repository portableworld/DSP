class CreateCompilations < ActiveRecord::Migration
  def self.up
    create_table :compilations do |t|
      t.integer :user_id
      t.integer :content_id
      t.date :show_date

      t.timestamps
    end
  end

  def self.down
    drop_table :compilations
  end
end
