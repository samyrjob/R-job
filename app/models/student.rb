class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable

  TONGUES = ['Anglais', 'Espagnol', 'Italien', 'Russe', 'Allemand', 'Portugais', 'Arabe', 'Turc']

  PROFILES = ['Business School', 'Engineer School', 'Universités / Sciences Politiques']

  YEAR = ['Stage découverte', 'stage court niveau licence', 'stage long niveau licence', 'stage long Master 1', 'Stage long année de césure', 'stage court année de césure', 'stage de fin de scolarité/pré-embauche']

  PHONE_REGEX = /(06|07)\d{8}/

  MOBILITY = ['Europe du Nord', 'Europe du Sud', 'Est de l`Europe', 'Allemagne/Région Benelux']

  AREA = ['Finance', 'Recrutement', 'Audit/Conseil', 'Marketing/communication']
  # SCHOOLS = BUSINESSCHOOLS + ENGINEERSCHOOLS


  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :profile, presence: true, inclusion: { in: PROFILES }
  validates :school, presence: true
  validates :wanted_area, presence: true, inclusion: { in: AREA }
  validates :phone_number, presence: true
  validates_format_of :phone_number, with: PHONE_REGEX
  validates :mobility, presence: true, inclusion: { in: MOBILITY }
  validates :year, presence: true, inclusion: { in: YEAR }
  validates :disponibility, presence: true
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tongues, presence: true, inclusion: { in: TONGUES }
  has_many_attached :dossiers
  # validates :dossiers, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }
  validates :dossiers, limit: { min: 1, max: 3 }, attached: true, content_type: { in: 'application/pdf', message: 'is not a PDF' }

  validate :photo_format

private

def photo_format
  return unless photo.attached?
  return if photo.blob.content_type.start_with? 'image/'
  photo.purge_later
  errors.add(:photo, 'needs to be an image')
end

  # validates :dossiers,file_content_type: { allow: ['image/jpeg', 'image/png', 'application/pdf'] }
  # validates_attachment :dossiers, blob: { content_type: ['application/pdf',
  #   'application/vnd.ms-excel',
  #   'application/msword',
  #   'text/plain',
  #   'image/png',
  #   'text/csv',] }

  # validates_attachment :dossiers, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  # validates :dossiers, attached: true, content_type: ['application/pdf']
  # EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  # validates_format_of :email, with: EMAIL_REGEX

#   GMAIL_DOMAINS = %w{gmail.com googlemail.com hotmail.fr hotmail.com }

# validates :email_is_gmail

# private
# def email_is_gmail
#   GMAIL_DOMAINS.each do |domain|
#     return true if email.end_with?('@' + domain)
#   end
# end




end
