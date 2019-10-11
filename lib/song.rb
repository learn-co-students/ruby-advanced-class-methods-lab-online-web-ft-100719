class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.all << self
  end
  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    existing_song = self.find_by_name(name)
    if existing_song
      existing_song
    else
      self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.get_song_info(file_name)
    file_name.split(/-|\.mp3/).map{|info| info.strip}
  end
  def self.new_from_filename(file_name)
    song_info  = self.get_song_info(file_name)
    new_song = self.new_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end
  def self.create_from_filename(file_name)
    song_info = self.get_song_info(file_name)
    new_song = self.create_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end
  def self.destroy_all
    self.all.clear
  end
end
