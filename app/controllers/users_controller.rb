class UsersController < ApplicationController
	def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in(@user)
      AuthMailer.signup_email(@user).deliver!
      redirect_to users_url
    else
      render :json => @user.errors.full_messages
    end
  end

	def index
		@users = User.all
	end
end
