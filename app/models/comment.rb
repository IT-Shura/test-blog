class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :content, :post, :author, presence: true

  has_closure_tree dependent: :destroy
  acts_as_tree
end
