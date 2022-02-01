class Genre < ApplicationRecord
     #This define one end of a many to many relationships
     #it requires that "genre_songs" join table exists,
     #and the table should have genre_id and song_id
     has_and_belongs_to_many :songs
end
