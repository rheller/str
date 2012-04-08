class AddSlugsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :next_slug,           :string
    add_column :pages, :prev_slug,           :string
  end

  def self.down
    remove_column :pages, :next_slug
    remove_column :pages, :prev_slug
  end
end
