class AddCountsToCategories < ActiveRecord::Migration
  def change
     add_column :categories, :childs_count, :integer, :null => false, :default => 0
     add_column :categories, :posts_count, :integer, :null => false, :default => 0
  end
end
