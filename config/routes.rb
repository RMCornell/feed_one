Rails.application.routes.draw do
  root 'home#index'

  #Authorization Routes

  get 'auth/instagram', as: '/login_instagram'
  get 'auth/instagram/callback', to: 'sessions#create_instagram'
  resources :instagram_users, only: [:show]

  get 'auth/twitter', as: '/login_twitter'
  get 'auth/twitter/callback', to: 'sessions#create_twitter'
  resources :twitter_users, only: [:show]

  delete '/logout', to: 'home#destroy'

end
