class Album < ApplicationRecord
    has_many :songs
    has_many :artists, through: 'songs'


    #Model own helpers
    def artist
        self.artists.uniq.first #Assumption is that there actually is only one artist per album 
    end #artist()


    # def print_nicely
    #     " '#{self.title}' by #{self.artist.name } "
    # end

    #Automatically ruby will look for this method if not defined it will print result by the default method
    #Equivalent of what we have above print_nicely
    def to_s
        " '#{self.title}' by #{self.artist.name } "
    end

    def song_titles
        self.songs.pluck(:title).join(" - ")
    end
end
