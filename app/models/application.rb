class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :student
  validates :description, presence: false
  has_many_attached :images
  # validates :images, limit: { min: 1, max: 3 }, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }
  validates :status, inclusion: { in: %w[accepted pending declined kept nokept] }
end
