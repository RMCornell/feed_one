class InstagramUser < ActiveRecord::Base
  def self.find_or_create_from_auth(oauth)
    instagram_user = InstagramUser.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    instagram_user.name = oauth.info.name
    instagram_user.nickname = oauth.info.nickname
    instagram_user.image = oauth.info.image
    instagram_user.token = oauth.credentials.token
    instagram_user.save

    instagram_user
  end

  def instagram_client
    @instagram_client ||= Instagram.client(access_token: token)
  end

end
