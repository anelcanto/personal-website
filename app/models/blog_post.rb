# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_rich_text :body

  validates :title, :body, presence: true
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where('published_at <= ?', Time.current).order(published_at: :desc) }
  scope :scheduled, -> { where('published_at > ?', Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def schedule?
    published_at? && published_at > Time.current
  end
end
