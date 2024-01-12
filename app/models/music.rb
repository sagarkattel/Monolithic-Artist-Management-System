class Music < ApplicationRecord
  validates :title, presence:true
  validates :album_name, presence:true
  validates :genre, presence:true
  belongs_to :artist ,class_name: "Artist"
  enum genre: {RNB: 'rnb', Country: 'country', Classic: 'classic', Rock: 'rock', Jazz: 'jazz'}
end