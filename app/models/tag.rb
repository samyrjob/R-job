class Tag < ApplicationRecord



  belongs_to :student
  validates :domaine, presence: true

end
