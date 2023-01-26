class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  TONGUES = ['Anglais', 'Espagnol', 'Italien', 'Russe', 'Allemand', 'Portugais', 'Arabe', 'Turc']

  PROFILES = ['Business School', 'Engineer School']

  BUSINESSCHOOLS = ['Audencia', 'Kedge', 'Essec', 'HEC', 'Em Lyon']
  ENGINEERSCHOOLS = ['INSA','Centrale','Mines','Polytechnique']

  SCHOOLS = BUSINESSCHOOLS + ENGINEERSCHOOLS


  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :profile, presence: true,inclusion: { in: PROFILES }
  validates :school, presence: true, inclusion: { in: SCHOOLS }
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tongues, inclusion: { in: TONGUES }
end
