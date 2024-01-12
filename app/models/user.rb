class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :dob, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  enum gender: { Male: 'M', Female: 'F', Other: 'O' }
end