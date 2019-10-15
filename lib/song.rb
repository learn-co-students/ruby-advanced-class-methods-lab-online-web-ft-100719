require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #Class constructor that intializes a song and saves it
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(song_name) #Class constructor that takes in the name of song and returns the instance with the name set as its name property
    song = self.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name) #Class constructor takes in str name of song, returns song instance with name set as name property saved to @@all
    song = self.create
    song.name = song_name
    return song
  end

  def self.find_by_name(song_name) #Class finder at accepts the string name of a song and returns the matching instance of the song with that name
    found = self.all.find {|song| song.name == song_name}
    found
  end

  def self.find_or_create_by_name(song_name) #Class method that will accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance
    found = self.find_by_name(song_name)
    if found
      found
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical #Class method that returns all the songs in ascending (a-z) alphabetical order
    sorted_list = self.all.sort_by{|song| song.name}
    sorted_list
  end

    def self.new_from_filename(filename) #Class constructor that accepts a filename in the format of " - .mp3", for example, "Taylor Swift - Blank Space.mp3"
      songs_array = filename.split(" - ")
      songs_array[1] = songs_array[1].chomp(".mp3")
      song = self.new
      song.name = songs_array[1]
      song.artist_name = songs_array[0]
      song
    end

    def self.create_from_filename(filename)
      created = self.new_from_filename(filename)
      song = self.create
      song.name = created.name
      song.artist_name = created.artist_name
      song
    end

    def self.destroy_all
      self.all.clear
    end

end
