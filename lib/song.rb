require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name=name  
  # end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

   def self.create
    song= Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song =Song.new
    song.name=name
    song
  end

  def self.create_by_name(name)
    song=Song.create
    song.name=name
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    # song=Song.new_by_name(name)
    if song=find_by_name(name)
      song
    else
      song=Song.create_by_name(name)
      song
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    song =Song.new
    file=file_name.split(" - ")
    song.artist_name=file[0]
    song.name=file[1].delete_suffix(".mp3")
    song
  end
  
  def self.create_from_filename(file_name)
    song =Song.create
    file=file_name.split(" - ")
    song.artist_name=file[0]
    song.name=file[1].delete_suffix(".mp3")
    song
  end
  
  def self.destroy_all
    @@all=[]
  end
  
end
