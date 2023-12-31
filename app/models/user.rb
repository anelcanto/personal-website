# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :blog_posts, foreign_key: :author_id
  validates :terms_of_service, acceptance: true
  enum role: { standard: 0, author: 1, moderator: 2, admin: 3 }
  has_one_attached :avatar

  scope :admins, -> { where(role: 'admin') }
  def admin?
    role == 'admin'
  end
end
