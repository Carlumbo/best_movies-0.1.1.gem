class BestMovies::CLI
  
  def call 
    list_movies
    menu 
    goodbye
  end 
  
  def list_movies
    puts "Top 25 movies"
    @movies = BestMovies::Movie.alltime
    # binding.pry
    @titles, @rank , @synopsis , @actors, @urls = @movies[:titles] ,  @movies[:rank_spot], @movies[:synopsis] , @movies[:actors] , @movies[:urls]
    # @rank = @movies[:rank_spot]
    @titles.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie}"
    end 
  end 

  def menu 
    # puts "enter the rak of the movie you would like the information of:"
   input = nil 
   while input != "exit"
     puts "\n Enter the rank of the movie you would like the information of or type list to see the movies again:"
     input = gets.strip.downcase
     if input.to_i > 0
       puts "#{@titles[input.to_i-1]}\n Starring:#{@actors[input.to_i-1]} \n\n Plot:#{@synopsis[input.to_i-1]} info at #{@urls[input.to_i-1]}"
     elsif input == "list"
        list_movies
     elsif input == "exit"
      nil 
     else 
        
        puts "Invalid input, type list for more options or exit."
      end 
    end 
  end 
  
  def goodbye 
    puts "See you for your next showtime!"
  end 
  
end 
    
    