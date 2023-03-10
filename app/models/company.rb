class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CATEGORIES = ['Banque/Assurance', 'Ressources humaines/Recrutement','Conseil', 'Audit', 'Fin tech','Communication', 'Finance', 'Commerce/Ventes/Marketing', 'Services', 'Achats/Logistique', 'Autre']
  STRUCTURES = ['PME', 'ETI', 'Micro-Entreprise', 'Grande Entreprise', 'Grande société mondiale' , 'Autre']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable

  has_many :offers, dependent: :destroy
  validates :sector, presence: true, inclusion: { in: CATEGORIES }
  validates :structure, presence: true, inclusion: { in: STRUCTURES }
  validates :name, presence: true
  validates :website, presence: true
  has_one_attached :photo
  has_many :comments, dependent: :destroy

end
