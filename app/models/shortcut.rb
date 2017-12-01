class Shortcut < ApplicationRecord
  has_many :visits

  validates :original_url, format: URI::regexp(%w(http https))
end
