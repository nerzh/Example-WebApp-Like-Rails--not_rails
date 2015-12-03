class Game < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :code
      t.integer :length
      t.integer :level
      t.integer :turns
      t.integer :hint
      t.boolean :win, default: false
      t.integer :hints
    end
  end
 
  def self.down
    drop_table :games
  end
end