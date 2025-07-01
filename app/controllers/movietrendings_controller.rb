class MovietrendingsController < ApplicationController

  def index
    @time_window=params[:time_window]
    @page=params[:page]

    movie_trending=Tmdb::MovieTrendingService.new(time_window:@time_window,page:1).execute

    render json:movie_trending
  end

end
