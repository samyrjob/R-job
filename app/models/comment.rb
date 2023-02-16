class Comment < ApplicationRecord
  belongs_to :company
  belongs_to :application
  validates :content, presence: true
end
