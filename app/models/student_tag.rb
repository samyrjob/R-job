class StudentTag < ApplicationRecord

    AREA = ['Finance', 'Recrutement', 'Audit/Conseil', 'Marketing/communication']

  belongs_to :student
  validates :tag, presence: true, inclusion: { in: AREA }

end
