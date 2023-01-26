class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CATEGORIES = ['Banque/Assurance', 'Ressources humaines/Recrutement','Conseil/Audit', 'Marketing/Communication', 'Finance']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :offers, dependent: :destroy
  validates :sector, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  has_one_attached :photo
end
