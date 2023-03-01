class Offer < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :description, presence: true
  validates :function, presence: true
  validates :town, presence: true
  validates :start_date, presence: true
  validates :salary, presence: false
  validates :duration, presence: true
  has_rich_text :description

  # self.per_page = 7


end
