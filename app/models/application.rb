class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :student
  validates :description, presence: true

  validates :status, inclusion: { in: %w[accepted pending declined] }
end
