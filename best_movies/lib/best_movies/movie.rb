class BestMovies::Movie

  attr_accessor :title , :ranks , :descriptions, :leading_actors , :year
 @@all = []
 
  def initialize(title, ranks, descriptions, leading_actors, year)
    @title= title
    @ranks = ranks
    @leading_actors = leading_actors 
    @descriptions = descriptions 
    @year = year  
    save
  end 
  def save
    @@all << self
  end 

end 


