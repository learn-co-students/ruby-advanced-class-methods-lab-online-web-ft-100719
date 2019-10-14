require 'pry'

class Song
  attr_accessor :name, :artist_name
  
  
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.select{|title| title.name == name}[0]
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    #@@all.sort { |song1, song2| song1.name <=> song2.name }
    @@all.sort_by { |song| song.name }
  end
  
  def  self.new_from_filename(filename)
    info_from_file = filename.gsub(".mp3", "").split(" - ")
    song = self.find_or_create_by_name(info_from_file[1])
    song.artist_name = info_from_file[0]
    song
  end

  def  self.create_from_filename(filename)
    # info_from_file = filename.gsub(".mp3", "").split(" - ")
    # song = self.find_or_create_by_name(info_from_file[1])
    # song.artist_name = info_from_file[0]
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    @@all = []
  end

  def self.all                #class method
    @@all
  end

  def save                    #instance method
    self.class.all << self
  end

end

# self is a context word
  # attached to an instance method, it is an instance
  # attached to a class method, it is a class
