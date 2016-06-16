# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  content     :text
#  post_id     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approved_at :datetime
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_03de2dc08c  (user_id => users.id)
#  fk_rails_2fd19c0db7  (post_id => posts.id)
#

class Comment < ActiveRecord::Base
  resourcify
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :content, :post, :author, presence: true, length: { minimum: 6 }
  
  def approve!
    touch(:approved_at)
  end
  
  def decline!
    self.approved_at = nil
    save
  end
  
  def declined?
    self.approved_at.nil?
  end 
  
  def approved?
    !declined?
  end  
end
