# Cidade onde o restaurante fica. Alimenta o filtro de região do UC-C04
# a busca não usa mapa, a cidade é escolhida numa lista.
class City < ApplicationRecord
  has_many :restaurants, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { scope: :state, case_sensiative: false }
  validates :state, presence: true
end
