
class Artist < ApplicationRecord
    validates :name ,presence: true
    validates :dob, presence: true
    validates :gender, presence: true
    validates  :address, presence: true
    validates :first_release_year, presence: true
    validates :no_of_albums_released, presence: true

    has_many :music
    enum gender: { Male: 'M', Female: 'F', Other: 'O' }
end

