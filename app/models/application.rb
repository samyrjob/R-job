class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :student
  validates :description, presence: true
  has_many_attached :dossiers
  validates :status, inclusion: { in: %w[accepted pending declined] }
end



