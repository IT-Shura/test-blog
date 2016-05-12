class Category < ActiveRecord::Base
  validates :title, :presence => true
  validates :desc, :presence => true

  belongs_to :parent, :class_name => 'Category', counter_cache: :childs_count
  has_many :childrens, :class_name => 'Category', :foreign_key => :parent_id

  has_many :posts

  scope :top, -> {
    where(parent_id: nil)
  }

  def parent_title
    parent.try(:title)
  end

  def has_parent?
    parent.present?
  end

  def has_childrens?
    childrens.exists?
  end
end
