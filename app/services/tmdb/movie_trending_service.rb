class Tmdb::MovieTrendingService < Tmdb::Base
  def initialize(time_window:, page: 1)
    @time_window = time_window
    @page = page
  end

  def execute
    res = tmdb.get("#{BASE_URL}/trending/all/#{@time_window}?language=en-US&page=#{@page}")
    res = JSON.parse(res)

    if res["success"] == false
      { message: "Something went wrong" }
    else
      res
    end
  end
end
