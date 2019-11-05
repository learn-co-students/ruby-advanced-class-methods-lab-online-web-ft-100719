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
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    @@all << song
    song
  end
  
  def self.find_by_name(name_search)
    self.all.find{|song| song.name == name_search}
  end
  
  def self.find_or_create_by_name(new_name)
    if find_by_name(new_name) != nil 
      return find_by_name(new_name)
    else 
      create_by_name(new_name)
    end
    
  end
  
  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end
  
  def self.new_from_filename(filename)
    name_artist_ext = filename.split(".")
    songname_artist = name_artist_ext[0].split(" - ")
    song_artist = songname_artist[0]
    song_name = songname_artist[1]
    
    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
    
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
