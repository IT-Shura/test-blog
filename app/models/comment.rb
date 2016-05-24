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
