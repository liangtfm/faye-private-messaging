class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])

    if user
      sign_in(user)
      redirect_to users_url
    else
      render :json => "No account found with that username"
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end