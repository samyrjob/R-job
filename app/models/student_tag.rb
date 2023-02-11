class StudentTag < ApplicationRecord
  belongs_to :student
  belongs_to :tag
end
