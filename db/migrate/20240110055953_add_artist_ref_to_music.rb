class AddArtistRefToMusic < ActiveRecord::Migration[7.1]
  def change
    add_reference :musics, :artist, null: false, foreign_key: true
  end
end
