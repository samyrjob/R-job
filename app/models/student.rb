class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable

  TONGUES = ['Anglais', 'Espagnol', 'Italien', 'Russe', 'Allemand', 'Portugais', 'Arabe', 'Turc']

  PROFILES = ['Business School', 'Formation ingénieure', 'Universités / IEP']


  PHONE_REGEX = /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/

  MOBILITY = ['Emmenez-moi où vous voulez !', 'Espagne', 'Portugal', 'Pays-bas', 'Autre']

  AREA = ['Finance', 'Audit/Conseil', 'Marketing/communication', "Tech", "Ressources humaines/Recrutement", "Business Development",
          "Comtabilité/Contrôle de gestion", "Logistique/supply Chain", "Ventes", "Autre"]

  has_many :tags
  # has_many :tags, through: :student_tags
  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :profile, presence: true, inclusion: { in: PROFILES }
  validates :school, presence: true
  validates :wanted_area, presence: true, inclusion: { in: AREA }
  validates :phone_number, presence: false
  validates :linkedin, presence: false
  validates_format_of :phone_number, with: PHONE_REGEX, allow_blank: true
  validates :mobility, presence: true, inclusion: { in: MOBILITY }
  validates :year, presence: true
  validates :disponibility, presence: true
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: false

  # validates :dossiers, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }

  validate :photo_format

private

def photo_format
  return unless photo.attached?
  return if photo.blob.content_type.start_with? 'image/'
  photo.purge_later
  errors.add(:photo, 'needs to be an image')
end





end
