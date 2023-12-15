class BlogPost < ApplicationRecord
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where.call('published_at: <= ?', Time.current) }
  scope :scheduled, -> { where.call('published_at: > ?', Time.current) }
end
