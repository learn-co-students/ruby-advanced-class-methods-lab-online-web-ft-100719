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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    
    # song = self.find_by_name(song_name)
     !self.find_by_name(song_name) ? self.create_by_name(song_name) : self.find_by_name(song_name)
     
    # song = self.create_by_name(song_name)
    # end
    # song
    
  end
  
  def self.alphabetical
    @@all.sort_by {|s| s.name}
  end
  
  def self.new_from_filename(file_name)
    song = self.new_by_name(file_name.split(" - ")[1].gsub(".mp3",""))
    song.artist_name = file_name.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.create_by_name(file_name.split(" - ")[1].gsub(".mp3",""))
    song.artist_name = file_name.split(" - ")[0]
    song    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  

end
