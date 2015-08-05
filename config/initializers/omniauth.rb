Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :instagram, ENV['instagram_key'], ENV['instagram_secret']
end
