class SessionsController < ApplicationController
  def create
    @instagram_user = InstagramUser.find_or_create_from_auth(request.env['omniauth.auth'])

    if @instagram_user
      session[:user_id] = @instagram_user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear

    redirect_to root_path
  end
end
