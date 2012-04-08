class ReviseThings < ActiveRecord::Migration
  def self.up
    add_column :things, :category,           :string, :limit => 40
    add_column :things, :purchased_from,  :string, :limit => 40
    add_column :things, :loaned_to,          :string, :limit => 40
    remove_column :things, :warranty
    rename_column :things, :reminder, :remind_random
    rename_column :things, :maintain, :remind_on
  end

  def self.down
    remove_column :things, :category
    remove_column :things, :purchased_from
    remove_column :things, :loaned_to
    add_column :things, :warranty, :datetime
    rename_column :things, :remind_random, :reminder
    rename_column :things, :remind_on, :maintain
  end
end
