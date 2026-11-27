# Liga um restaurante a uma tag (relação N:N). O mesmo par não se repete.
class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :restaurant_id }
end
