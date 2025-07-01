class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
        comment = Comment.new(
        user_id: current_user.id,
        movie_id: params[:movie_id],
        description: params[:description]
        )
        if comment.save
            render json: comment, status: :created
        else
            render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
  end
end
