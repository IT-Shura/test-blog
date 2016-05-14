class ChangeApprovedDefaultsInPosts < ActiveRecord::Migration
  def change
    change_column_null(:posts, :approved_at, true)
  end
end
