Rails.application.routes.draw do
  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'welcome#index', as: :user_root
  post :incoming, to: 'incoming#create'

  resources :users, except: [:index]
  resources :bookmarks

  unauthenticated do
    root to: 'home#show', as: :unauthed_root
  end
end


