class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all << self
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
    
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    found_song ? found_song : self.create_by_name(name)
  end

  def self.alphabetical
    sort = self.all.sort_by {|song| song.name}
    sort
  end
end

end
