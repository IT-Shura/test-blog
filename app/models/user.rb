class User < ActiveRecord::Base
  rolify
  acts_as_commontator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def move_to(user)
    #todos.update_all(user_id: user.id)
  end

end
