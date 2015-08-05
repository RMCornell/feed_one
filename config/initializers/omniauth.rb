Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :instagram, ENV['instagram_key'], ENV['instagram_secret']
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
end


