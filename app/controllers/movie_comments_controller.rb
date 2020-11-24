class MovieCommentsController < ApplicationController

  def create
        movie = Movie.find(params[:movie_id])
        comment = current_user.movie_comments.new(movie_comment_params)
        comment.movie_id = movie.id
        comment.save
        redirect_to movie_path(movie)
  end

  def destroy
        movie = BookComment.find(params[:id]).book
        MovieComment.find(params[:id]).destroy
        redirect_to movie_path(movie)
  end

  private
  def movie_comment_params
        params.require(:movie_comment).permit(:comment, :movie_id, :user_id)

  end

end
