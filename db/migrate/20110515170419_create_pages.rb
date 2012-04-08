class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|


      t.string :title
      t.text :part1
      t.text :part2
      t.text :embedded
      t.text :links
      t.text :extra
      t.integer :next_page
      t.integer :prev_page 
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
