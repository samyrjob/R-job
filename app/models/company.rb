class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CATEGORIES = ['Banque/Assurance', 'Ressources humaines/Recrutement','Conseil/Audit', 'Marketing/Communication', 'Finance', 'Ventes']
  STRUCTURES = ['PME', 'ETI', 'Micro-Entreprise', 'Grande Entreprise', 'Grande société mondiale']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable

  has_many :offers, dependent: :destroy
  validates :sector, presence: true, inclusion: { in: CATEGORIES }
  validates :structure, presence: true, inclusion: { in: STRUCTURES }
  validates :name, presence: true
  has_one_attached :photo
end
