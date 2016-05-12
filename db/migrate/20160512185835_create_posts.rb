class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :desc
      t.references :category, index: true, foreign_key: true
      t.datetime :approved_at

      t.timestamps null: false
    end
  end
end
