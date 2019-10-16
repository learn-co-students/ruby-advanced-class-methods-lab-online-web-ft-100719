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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    create_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = Song.new
    song_artist = file.split(' - ')[0].to_s
    song_name = file.split(' - ')[1].split('.')[0].to_s
    song.name = song_name
    song.artist_name = song_artist
    song.save
    song
  end

  def self.create_from_filename(file)
    song_artist = file.split(' - ')[0].to_s
    song_name = file.split(' - ')[1].split('.')[0].to_s
    song = create_by_name(song_name)
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
