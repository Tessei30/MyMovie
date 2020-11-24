class MoviesController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]


  def index
    @user = User.find(current_user.id)
    @movies = Movie.all
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @user = @movie.user
    @movie_comment = MovieComment.new
    @movie_comments = MovieComment.all
  end

  def create
  	@movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
  	if @movie.save!
  	    redirect_to @movie
  	else
        @movies = Movie.all
        @user = current_user
        render :index
        end
  end

  def edit
    @movie = Movie.find(params[:id])
    @new_movie = Movie.new
    @user = @movie.user
    unless @movie.user_id == current_user.id
       redirect_to movies_path
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie.id), notice: "Movie was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy
  	redirect_to movies_path
  end

  def search
    @user = User.find(current_user.id)
    @movie = Movie.new
    @movies = Movie.search(params[:keyword])
  end

  private
  def movie_params
  	  params.require(:movie).permit(:title, :body_title, :bdy)
  end
end
