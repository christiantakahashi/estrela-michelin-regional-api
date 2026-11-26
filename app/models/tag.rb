class Tag < ApplicationRecord
  enum :category, { cuisine: 0, occasion: 1, vibe: 2, amenity: 3 }, validate: true

  validates :name, presence: true, uniqueness: { scope: :category, case_sensitive: false }
  validates :category, presence: true
end
