class TwitterUser < ActiveRecord::Base
  def self.find_or_create_from_auth(auth_info)
    if twitter_user ||= find_by(uid: auth_info.extra.raw_info.user_id)
      twitter_user
    else
      create({name: auth_info.extra.raw_info.name,
              nickname: auth_info.extra.raw_info.screen_name,
              uid: auth_info.extra.raw_info.user_id,
              token: auth_info.credentials.token,
              token_secret: auth_info.credentials.secret
      })
    end
  end

  def twitter_client
    twitter_user = TwitterUser.find(self.id)
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = twitter_user.token
      config.access_token_secret = twitter_user.token_secret
    end
  end

  def timeline
     twitter_client.home_timeline
  end
end
