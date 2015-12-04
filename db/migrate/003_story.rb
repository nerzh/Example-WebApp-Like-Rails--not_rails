class Story < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :secret_code
      t.string :human_code
      t.string :result
      t.integer :game_id
    end
  end
 
  def self.down
    drop_table :stories
  end
end