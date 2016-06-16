# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  title        :string
#  desc         :text
#  parent_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  childs_count :integer          default(0), not null
#  posts_count  :integer          default(0), not null
#

class Category < ActiveRecord::Base
  resourcify
  has_closure_tree
  validates :title, :presence => true
  validates :desc, :presence => true
  has_many :posts

end
