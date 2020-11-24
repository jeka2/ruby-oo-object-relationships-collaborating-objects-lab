class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def add_song(song)
        @songs << song
        @songs
    end

    def self.find_or_create_by_name(name)
        unless @@all.find { |author| author.name == name }
            artist = self.new(name)
        else
            @@all.find { |author| author.name == name }
        end
    end 

    def songs
        @songs
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end

    def self.all
        @@all
    end
end