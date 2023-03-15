class Offer < ApplicationRecord
  extend FriendlyId
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :description, presence: true
  validates :function, presence: true
  validates :town, presence: true
  validates :start_date, presence: true
  validates :salary, presence: false
  validates :duration, presence: true
  # has_rich_text :description
  # has_one :action_text_rich_text,
  # class_name: 'ActionText::RichText',
  # as: :record


  # self.per_page = 7
  friendly_id :function, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    function_changed? || slug.blank?
  end
end
