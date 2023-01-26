class Offer < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  validates :description, presence: true
  validates :function, presence: true
  has_one_attached :image, dependent: :destroy
end
