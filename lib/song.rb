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

  def self.new_by_name(namestring)
    song = self.new
    song.name = namestring
    song
  end
  
  def self.create_by_name(namestring)
    song = self.new
    song.name = namestring
    @@all << song
    song
  end
  
  def self.find_by_name(namestring)
  #  @@all.each do |song|
   #   if(song.name == namestring)
    #    return song
  #    end
   # end
  #  false
    
    @@all.find{|song| song.name == namestring }
    
  end
  
  def self.find_or_create_by_name(namestring)
    if !self.find_by_name(namestring)
      self.create_by_name(namestring)
    else
     self.find_by_name(namestring)
    end
    
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    
    info = filename.split(" - ")
    song = self.new_by_name(info[1].gsub(".mp3", ""))
    song.artist_name = info[0]
    song
    
  end
  
  def self.create_from_filename(filename)
    
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end






