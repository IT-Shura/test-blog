class Post < ActiveRecord::Base
  resourcify
  attr_accessor :approved
  validates :title, :presence => true, uniqueness: true, length: { minimum: 6 }
  validates :content, :presence => true

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  after_initialize do
    self.approved =  @attributes[:approved_at].present?
  end
end