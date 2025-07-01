class Tmdb::MovieDetailService < Tmdb::Base
  def initialize(movie_id:)
    @movie_id=movie_id
  end

  def execute
    res=tmdb.get("#{BASE_URL}/movie/#{@movie_id}")
    res=JSON.parse(res)
    if res["success"] == false
      {message:"Something went wromg"}
      else
      res
    end
  end
end