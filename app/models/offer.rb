class Offer < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :description, presence: true
  validates :function, presence: true
  validates :town, presence: true
  validates :start_date, presence: true
  validates :salary, presence: true
  validates :duration, presence: true
  has_one_attached :image
  # self.per_page = 7
  

end
