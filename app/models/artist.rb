class Artist < ApplicationRecord
    has_many :songs
    #Free Association - No extra joining table or ids require due 
    #Due to songs relationships songs -> genres, songs-> albums 
    #Songs being the in-between model
    has_many :genres, through: 'songs' #Could also be written like a symbool :songs'
    has_many :mixtapes, through: 'songs'
    has_many :albums, through: 'songs'
end
