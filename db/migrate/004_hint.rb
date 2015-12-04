class Hint < ActiveRecord::Migration
  def self.up
    create_table :hints do |t|
      t.string  :hint
      t.integer :game_id
    end
  end
 
  def self.down
    drop_table :hints
  end
end