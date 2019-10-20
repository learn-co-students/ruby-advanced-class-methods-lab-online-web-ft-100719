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
  
  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end 
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name 
        return song 
      end
    end  
    nil
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end 
  end   
  
  def self.alphabetical
    @@all.sort_by { |song| song.name  }
  end 
  
  def self.new_from_filename(filename)
    
      # "Taylor Swift - Blank Space.mp3"

         filename = filename.split(/\s*[-,.]\s*/)
         artist_name = filename[0]
         name = filename[1]
      
         song = self.new
         song.name = name
         song.artist_name = artist_name
         song
  end 
  
  def self.create_from_filename(filename)
    
         filename = filename.split(/\s*[-,.]\s*/)
         artist_name = filename[0]
         name = filename[1]
         
         # add file info to song class 
         song = self.new
         song.name = name
         @@all << song
         song.artist_name = artist_name
         song
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  
    
  
end
