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
    self.all.push(song)
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create # calls on create method defined above
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find{ |song| 
      song.name == song_name
    }
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song
      song
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| 
      song.name
    }
  end

  def self.new_from_filename(file_name)
    song_info  = self.get_song_info(file_name)
    new_song = self.new_by_name(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end

  def self.get_song_info(file_name)
    file_name.split(/-|\.mp3/).map{ |extension| 
      extension.strip
    }
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
end # end of Song class
