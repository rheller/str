class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|

      t.integer :user_id  #the owner of the thing
      t.string :title
      t.text :description
      t.float :price      
      t.string :brand
      t.string :model
      t.date :acquired
      t.date :warranty
      t.date :maintain
      t.boolean :reminder
      t.timestamps
    end
#index to columns used in joins
  add_index :things, :user_id
  end

  def self.down
    drop_table :things
  end
end
