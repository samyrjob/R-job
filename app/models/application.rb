class Application < ApplicationRecord
  belongs_to :offer
  belongs_to :student
  validates :description, presence: true
end
