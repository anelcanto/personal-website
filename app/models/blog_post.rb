# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where('published_at <= ?', Time.current) }
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
