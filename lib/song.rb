require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = [] #class var all set to empty array

  def self.all
    @@all #returns the array of all songs
  end

  def save
    self.class.all << self #Song.
  end

  def self.create
    song=self.new #instantiates a new song OBJECT
    song.save#the song object is added to the array of all songs
    song#returns the current song
  end

  def self.new_by_name(song_name)
    song=self.new #instantiates a new song object
    song.name=song_name#takes the song object and gives it a name method- sets it to the song name we give it
    song #returns the song
  end

  def self.create_by_name(song_name)
    song=self.create #using the self.create method above- it creates a song and saves it to @@all
    song.name=song_name #sets the name property to the song name
    song#returns the song
  end

  def self.find_by_name(song_name)#takes in the string name of a song
    self.all.find{|song| song.name=="#{song_name}"} ##build class finders
    #returns matching instance of song with the name
  end

  def self.find_or_create_by_name(song_name)#invokes .find_by_name && .create_by_name instead of repeating code
    if !self.find_by_name(song_name)#doesn't create a new one when given title of existing song
      self.create_by_name(song_name)#creates new song object with proovided title if one doesn't already exist
    else
      self.find_by_name(song_name)#self.create_by_name(song_name)#returns existing song object
    end
  end

  def self.alphabetical
    self.all.sort{ |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(song_name)

    # song=self.new
    # song.name=song_name.split(/[\-\.]/)[1]
    # song
    song=self.new_by_name(song_name.split(" - ")[1].gsub(".mp3",""))
    song.artist_name=song_name.split(" - ")[0]
    song
  end

  def self.create_from_filename(song_name)
    song=self.create_by_name(song_name.split(" - ")[1].gsub(".mp3",""))
    song.artist_name=song_name.split(" - ")[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
