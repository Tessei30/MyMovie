class UsersController < ApplicationController
  before_action :authenticate_user!

	def index
		@user = User.find(current_user.id)
		@users = User.all
		@movie = Movie.new
	end

	def show
		@user = User.find(params[:id])
		@movie = Movie.new
	end

	def edit
		@user = User.find(params[:id])
		unless @user == current_user
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "User info was successfully updated."
		else
			render :edit
		end
	end

  def movies
    	@users = User.all
    	@movie = Movie.new
    	@movie = Movie.all
  end

  private

  def user_params
   	   params.require(:user).permit(:name, :profile_image)
  end
end
