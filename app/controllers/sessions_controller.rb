class SessionsController < ApplicationController
  def create_instagram
    @instagram_user = InstagramUser.find_or_create_from_auth(request.env['omniauth.auth'])

    if @instagram_user
      session[:user_id] = @instagram_user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def create_twitter
    @twitter_user = TwitterUser.find_or_create_from_auth(request.env['omniauth.auth'])

    if @twitter_user
      session[:user_id] = @twitter_user.id
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
