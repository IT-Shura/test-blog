class ChangeDescToContentToPosts < ActiveRecord::Migration
  def change
    rename_column(:posts, :desc, :content)
  end
end
