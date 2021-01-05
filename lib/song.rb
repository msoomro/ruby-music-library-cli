class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist.class == Artist
        self.genre = genre if genre.class == Genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        s = Song.new(name)
        s.save
        s
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.find_by_name(name)
        all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ||  create(name)
    end

end