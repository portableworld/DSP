class CreateTopBars < ActiveRecord::Migration
  def self.up
    create_table :top_bars do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :top_bars
  end
end
