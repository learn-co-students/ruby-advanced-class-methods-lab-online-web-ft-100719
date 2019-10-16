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
    song = self.new
    #@@all << song
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = new_by_name(name)
    #@@all << song
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = find_by_name(name) 
      song
    else
      create_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted_songs = @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    song_details = (filename.gsub(/\.mp3$/, '')).split("-")
    song = find_or_create_by_name(song_details[1].strip)
    song.artist_name = song_details[0].strip
    song
  end
  
  def self.create_from_filename(filename)
    song_details = (filename.gsub(/\.mp3$/, '')).split("-")
    song = find_or_create_by_name(song_details[1].strip)
    song.artist_name = song_details[0].strip
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
