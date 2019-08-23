class BestMovies::Scraper 
  attr_accessor :title , :ranks , :actors, :descriptions , :urls
  
  def self.alltime 
  #scrape ranker and then return things based on that DATA

  self.scrape_movies
  end 
  
def self.scrape_movies
     # movies = {}
    movies = self.scrape_ranker
  end 
  

    
  def self.scrape_ranker 
    doc = Nokogiri::HTML(open('https://www.ranker.com/crowdranked-list/the-best-movies-of-all-time'))
    @array = []
     movie_chunk_list = doc.search("div.listItem.listItem__h2.listItem__h2--grid.listItem__h2--popUp.pointer.listItem__h2--buyButton.flex.relative.robotoC")
     
     movie_chunk_list.each do |movie_chunk|
       title = movie_chunk.search("div.listItem__data a").text.gsub(/"* ...more/, "")
       descriptions = movie_chunk.search("div.listItem__data div.listItem__blather.grey.default span").text
       ranks = movie_chunk.search("strong.listItem__rank.block.center.instapaper_ignore").text
       years = movie_chunk.search("div.listItem__data div.listItem__blather.grey.default span").text.gsub(/[^0-9]/, '')
       leading_actors = movie_chunk.search("div.listItem__data span.listItem__props.block span.listItem__properties.black.default").text
      hash = {titles: title, rank_spot: ranks, synopsis: descriptions , actors: leading_actors, year: years}
      BestMovies::Movie.new(title, ranks, descriptions, leading_actors, years) 
 	  end 
   end

end 
