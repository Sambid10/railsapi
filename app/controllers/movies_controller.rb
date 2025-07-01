class MoviesController < ApplicationController
  
    def index
    @movies = Movie.all
    if @movies.present?
        render json: @movies.as_json(include: [:comments, :ratings])
    else
        response =HTTP.auth("Bearer  eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDQ4Njc2MjhiMjEzYTNjNTI5MGZlZWRlZTY5N2UwOSIsIm5iZiI6MTc1MTAxMDExOC42MTY5OTk5LCJzdWIiOiI2ODVlNGI0NmYzNzU2MGMwZjc4MDU4YTYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.AZiFqOvnOhM20RFrzXCYx3ZRVubpiz8jepimaFHD0xY")
                   .get("https://api.themoviedb.org/3/trending/all/day")
        @data = JSON.parse(response)
        @data["results"].each do |movie|
        Movie.create(
        name: movie["name"] || movie["title"],
        description: movie["overview"],
        picurl: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}"
        )
    end
    @movies = Movie.all
    render json: @movies.as_json(include: [:comments, :ratings])
    end
    end

    def show
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
    render json: @movie.as_json(include:[:comments,:ratings])
    end

end
