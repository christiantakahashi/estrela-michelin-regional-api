class Tag < ApplicationRecord
  enum :category, { cuisine: 0, occasion: 1, vibe: 2, amenity: 3 }, validate: true

  has_many :restaurant_tags, dependent: :destroy
  has_many :restaurants, through: :restaurant_tags

  validates :name, presence: true, uniqueness: { scope: :category, case_sensitive: false }
  validates :category, presence: true
end
