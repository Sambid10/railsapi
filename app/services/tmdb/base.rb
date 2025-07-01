module Tmdb
  class Base
    BASE_URL="https://api.themoviedb.org/3"
    def tmdb
      HTTP.auth("Bearer #{ENV['API_KEY']}")
    end
  end
end