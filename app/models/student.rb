class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  TONGUES = ['Anglais', 'Espagnol', 'Italien', 'Russe', 'Allemand', 'Portugais', 'Arabe', 'Turc']

  PROFILES = ['Business School', 'Engineer School', 'Universités / Sciences Politiques']

  # BUSINESSCHOOLS = ['Audencia', 'Kedge', 'Essec', 'HEC', 'Em Lyon']
  # ENGINEERSCHOOLS = ['INSA','Centrale','Mines','Polytechnique']

  # SCHOOLS = BUSINESSCHOOLS + ENGINEERSCHOOLS


  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  validates :profile, presence: true, inclusion: { in: PROFILES }
  validates :school, presence: true
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tongues, presence: true, inclusion: { in: TONGUES }

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
