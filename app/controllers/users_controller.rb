class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to users_url
    else
      render :json => @user.errors.full_messages
    end
  end

	def index
		@users = User.all
	end

	private

	def user_params
		params.require(:user).permit(:username)
	end
end
