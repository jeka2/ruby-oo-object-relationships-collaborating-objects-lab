class Song
    attr_accessor :name, :artist

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.new_by_filename(filename)
        artist, name, genre = name_parser(filename)
        new_instance = self.new(name)
        new_instance.artist_name = artist
        new_instance
    end

    def self.name_parser(name)
        arr = name.split(/\s*-\s*/)
    end
end