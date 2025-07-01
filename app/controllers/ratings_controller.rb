class RatingsController < ApplicationController
   before_action :authenticate_user!, only: [:create]
    def create
        rating=Rating.new(
            user_id: current_user.id,
            movie_id: params[:movie_id],
            rating: params[:rating]
        )
        if rating.save
            render json: rating, status: :created
        else
            render json: {errors:rating.errors.full_messages},status: :unprocessable_entity
        end
    end
end
