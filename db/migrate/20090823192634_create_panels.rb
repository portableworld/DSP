class CreatePanels < ActiveRecord::Migration
  def self.up
    create_table :panels do |t|
      t.string :title
      t.date :date_made
      t.string :live_state

      t.timestamps
    end
  end

  def self.down
    drop_table :panels
  end
end
