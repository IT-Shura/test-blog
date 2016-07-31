# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  category_id :integer
#  approved_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  views_count :integer          default(0)
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_5b5ddfd518  (user_id => users.id)
#  fk_rails_9b1b26f040  (category_id => categories.id)
#

class Post < ActiveRecord::Base
  resourcify
  acts_as_taggable
  attr_accessor :approved
  validates :title, :presence => true, uniqueness: true, length: { minimum: 6, maximum: 128 }
  validates :content, :presence => true

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  scope :filter_by_tag, ->(tag) { tagged_with(tag) if tag }
  
  after_initialize do
    self.approved =  @attributes[:approved_at].present?
  end
end
