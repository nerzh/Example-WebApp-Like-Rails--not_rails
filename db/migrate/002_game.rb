class Game < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string  :code
      t.integer :length
      t.integer :level
      t.string  :level_name
      t.integer :turns
      t.integer :hint
      t.boolean :win, default: false
    end
  end
 
  def self.down
    drop_table :games
  end
end