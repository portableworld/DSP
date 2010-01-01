class CreateLinkalations < ActiveRecord::Migration
  def self.up
    create_table :linkalations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :linkalations
  end
end
