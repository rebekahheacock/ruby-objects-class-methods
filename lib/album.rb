# Album class
class Album # Albums have an artist, title, and tracks
  # initalize w/artist & title
  # enable the retrieving of those attributes later
  # use attr_accessor to let tracks be added later
  attr_reader :artist
  attr_reader :title
  attr_accessor :tracks

  # sorry, Jeff
  @@collection = []

  def initialize(artist, title)
    @artist = artist
    @title = title
    @tracks = []

    # self is the instance, here inside this instance method
    @@collection << self
  end

  def self.search_for_title(title)
    @@collection.find { |album| album.title == title }
  end
end

# Song class (b/c we were asked to create an instance method on a song)
# songs can be created, then pushed to the tracks for an album
class Song
  attr_reader :title
  attr_accessor :rating

  # if no rating is supplied, set rating to nil
  def initialize(title, rating = nil)
    @title = title
    @rating = rating
  end
end
