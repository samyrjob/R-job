class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :applications, dependent: :destroy
  has_many :savedoffers, dependent: :destroy
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
end
