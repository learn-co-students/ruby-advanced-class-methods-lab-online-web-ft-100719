class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # Build a class constructor Song.create that initializes a song and saves it to the @@all class variable either literally 
  # or through the class method Song.all. 
  # This method should return the song instance that was initialized and saved
  def self.create
    song = self.new
    @@all << song
    song
  end

  # Build a class constructor Song.new_by_name that takes in the string name of a song
  # and returns a song instance with that name set as its name property. 
  # Song.new_by_name should return an instance of Song and not a simple string or anything else
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  # Build a class constructor Song.create_by_name that takes in the string name of a song
  # and returns a song instance with that name set as its name property and the song being saved into the @@all class variable
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  # Build a class finder Song.find_by_name that accepts the string name of a song
  # and returns the matching instance of the song with that name
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  # In order to prevent duplicate songs being created that actually represent the same song (based on the song name), 
  # we're going to build a Song.find_or_create_by_name class method. 
  # This method will accept a string name for a song and either return a matching song instance with that name
  # or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(name)
    #if self.find_by_name(name) == nil 
        #self.create_by_name(name)
      #else
        #self.find_by_name(name)
      #end
      self.find_by_name(name) || self.create_by_name(name)
      #the above statement is saying do this(if it is true) or that (if the first thing is not true and the second thing is true)
  end
  
  # Build a class method Song.alphabetical that returns all the songs in ascending (a-z) alphabetical order.
  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order
    @@all.sort_by{|x| x.name}
  end

  # Build a class constructor that accepts a filename in the format of " - .mp3", 
  # for example, "Taylor Swift - Blank Space.mp3".

  # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the constructor should return a new Song instance with the song name set to Blank Space
  # and the artist_name set to Taylor Swift. 
  # The filename input sent to Song.new_from_filename in the format of Taylor Swift - Blank Space.mp3 must be parsed for the relevant components. 
  # Separate the artist name from the rest of the data based on the - delimiter. 
  # Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.
  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  # Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". 
  # The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created
  def self.create_from_filename(name)
    #class mehtod should not only parse the filename correctly but should also save the song
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  # The Song.destroy_all class method should reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
  def self.destroy_all()
    #reset the state of the @@all class variable to an empty array therby deleting all previous song instances
    @@all.clear
  end

end


