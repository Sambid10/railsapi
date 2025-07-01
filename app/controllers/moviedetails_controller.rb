class MoviedetailsController < ApplicationController

  def index
    movie_id=params[:id]
    movie_detail=Tmdb::MovieDetailService.new(movie_id: movie_id).execute
    render json: movie_detail
  end

end
