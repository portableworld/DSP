class CreateVisualizations < ActiveRecord::Migration
  def self.up
    create_table :visualizations do |t|
      t.integer :user_id
      t.integer :panel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :visualizations
  end
end
