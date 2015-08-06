class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :current_twitter_user, :current_intstagram_user

  def current_intstagram_user
    @current_instagram_user ||= InstagramUser.find(session[:user_id]) if session[:user_id]
  end

  def current_twitter_user
    @current_twitter_user ||= TwitterUser.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    redirect_to root_path unless current_intstagram_user || current_twitter_user
  end
end
