Rails.application.routes.draw do
  root 'home#index'

  #Authorization Routes

  get 'auth/instagram', as: '/login_instagram', to: 'home#index'
  get 'auth/instagram/callback', to: 'sessions#create'
  resources :instagram_users, only: [:show]

  delete '/logout', to: 'home#destroy'
end
