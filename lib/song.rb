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
  def self.create
    song=self.new
    song.save
    song
  end
  def self.new_by_name(name)
    song=self.new
    #binding.pry
    song.name=name
    song
  end
  def self.create_by_name(name)
    song=self.new_by_name(name)
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.find do |i|
      if i.name == name
       return i
      end
    end
  end
  def self.find_or_create_by_name(song_name)
    #if self.find_by_name(song_name)
      #self.find_by_name(song_name)
    #else
      #self.create_by_name(song_name)
    #end
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  def self.alphabetical
    self.all.sort_by {|x| x.name }
  end
  def self.new_from_filename(file)
    info=file.gsub(".mp3","").split(" - ")
    info[1]
    #binding.pry
    song=self.new_by_name(info[1])
    song.artist_name=info[0]
    song
  end
  def self.create_from_filename(file)
    #info=file.gsub(".mp3","").split(" - ")
    #info[1]
    #binding.pry
    #song=self.create_by_name(info[1])
    #song.artist_name=info[0]
    #song
    song=self.new_from_filename(file)
    song.save
  end
  def self.destroy_all
    #self.all.clear
    @@all=[]
  end
end
