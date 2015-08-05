class TwitterUser < ActiveRecord::Base
  def self.find_or_create_from_auth(oauth)
    twitter_user = TwitterUser.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    twitter_user.name = oauth.info.name
    twitter_user.nickname = oauth.info.nickname
    twitter_user.token = oauth.credentials.token
    twitter_user.token_secret = oauth.credentials.secret
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = token
      config.access_token_secret = token_secret
    end
  end
end
