class Category < ActiveRecord::Base
  resourcify
  has_closure_tree
  validates :title, :presence => true
  validates :desc, :presence => true
  has_many :posts

end
