class Music < ApplicationRecord
  belongs_to :artist ,class_name: "Artist"
end