class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :blog_posts
  enum role: { standard: 0, author: 1, moderator: 2, admin: 3 }

  def admin?
    role == 'admin'
  end
end
