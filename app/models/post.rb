class Post < ActiveRecord::Base
  validates :title, :presence => true, uniqueness: true, length: { minimum: 8 }
  validates :desc, :presence => true

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :category
  has_many :comments
end
