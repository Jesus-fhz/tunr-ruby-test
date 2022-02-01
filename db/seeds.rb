# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


print "creating songs "

Song.destroy_all

s1 = Song.create! title: 'Achy Breaky Heart'
s2 = Song.create! title: 'Draw us in'
s3 = Song.create! title: 'Burn the Witch'
s4 = Song.create! title: 'Identikit'

puts "created  #{Song.count }  songs"

print "creating Artists "

Artist.destroy_all

art1 = Artist.create! name: 'Billy Ray Cyrus'
art2= Artist.create! name: 'Metz'
art3= Artist.create! name: 'Radio Head'

#Achy Breaky Heart (s1) is by Billy Ray Cyrus(Art1)
art1.songs << s1
#Draw Us In (s2) is by Mertz(Art2)
art2.songs << s2
#Both s3 and s4   is by Radio Head(Art3)
art3.songs << s3 << s4
#ActiveRecord is 'repeurposing' (overloading) the '<<' operator which ruby uses as an alias for .push
#Here it meas "The song s1 has its artist_id set to art1.id"

#You could stay say
#Song.create! title: 'wood de doop', artist_id: art1.id
#But the artist has to be created first for this happens, The '<<' operator let us add associations to existing objects later on


puts 'Testing Artist associations -< songs relation'
puts "The song #{Song.first.title} is by: #{Song.first.artist.name} }"
puts "The Artist #{Artist.last.name} has the songs: #{Artist.last.songs.pluck(:title).join(',')} }"

puts "Created #{ Artist.count  } artists."


print "creating Albums "

Album.destroy_all

alb1 = Album.create! title: 'Some Gave All', year: '1992'
alb2 = Album.create! title: 'Atlas Vending', year: '2021'
alb3 = Album.create! title: 'A Moon-shaped pool', year: '2016'


puts "Created #{ Album.count  } albums."

#Create Associations from songs to album

alb1.songs << s1
alb2.songs << s2
alb3.songs << s3 << s4


############################ 
Genre.destroy_all

g1 = Genre.create! name: 'Post Punk'
g2 = Genre.create! name: 'Math Rock'
g3 = Genre.create! name: 'Paranoid Art Rock'
g4 = Genre.create! name: 'Sadcore'
g5 = Genre.create! name: 'Country'
g6 = Genre.create! name: 'IDM'



Mixtape.destroy_all

mix1 = Mixtape.create! name: 'Ga-Mixtape'
mix2 = Mixtape.create! name: "Ruby's town"
mix3 = Mixtape.create! name: "I mean rail's town"
mix4 = Mixtape.create! name: 'So many cruds this week T_T'


#Push genres into Songs 
#And add song_id and genre_id into the joining table genres_songs
s1.genres << g5


#this will create 3 rows in the joining table genres_songs
s2.genres << g1 << g2 << g4 

s3.genres << g3 << g4 << g6

s4.genres << g3 << g4

#Because this many to many, you could also start fron the other end of the 
#associoation

#Testing genres >--< associations

puts "Genre '#{ g3.name }' has songs: #{ g3.songs.pluck(:title).join(' ,')}"
puts "Song  '#{ s4.title }' has genres: #{ s4.genres.pluck(:name).join(' ,') }"


#Push songs into mixtape using the joining table mixtapes_songs
#And insert song_id and mixtape_id in the joining table

#It could also be the other way around
# s1.mixtapes << mix1 << mix2
# s2.mixtapes << mix3 
# s3.mixtapes << mix1 << mix4
# s4.mixtapes <<  mix2

mix1.songs << s1 << s2 << s3 << s4
mix2.songs << s3 << s4
mix3.songs << s1 << s2

#Testing mixtapes >--< associations

puts "Mixtape '#{ mix1.name }' has songs: #{ mix1.songs.pluck(:title).join(' ,')}"
puts "Song  '#{ s4.title }' has mixtape: #{ s4.mixtapes.pluck(:name).join(' ,') }" 


puts "Creating users... "

User.destroy_all

u1 = User.create! email: 'luke@ga.co',  name:'luke', password: 'chicken'
u2 = User.create! email: 'ro@ga.co', name:'Rowena', password: 'chicken'
u3 = User.create! email: 'lay@ga.com', name: 'Lay', password: 'chicken'


u1.mixtapes << mix1 << mix3
u2.mixtapes << mix2

puts "User #{ User.first.name } has mixtapes: #{User.first.mixtapes.pluck(:name).join(' , ')}"
puts "Mixtape '#{ Mixtape.first.name } belongs to #{ Mixtape.first.user.name } '"

