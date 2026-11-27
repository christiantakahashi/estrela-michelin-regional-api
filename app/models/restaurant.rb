# Restaurante  que aparece na busca do UC-C04. Só entram na busca os
# aprovados, com faixa de preço e com tags de vibe e ocasião (RN-E05)
class Restaurant < ApplicationRecord
  # Faixas de preço válidas: 1 a 4, exibidas com $ a $$$$ no front.
  PRICE_RANGES = (1..4).freeze

  enum :status, { pending: 0, approved: 1, rejected: 2 }, validates: true

  belongs_to :city

  validates :name, presence: true
  validates :price_range, inclusion: { in: PRICE_RANGES }, allow_nil: true
  validates :average_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
