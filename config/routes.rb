Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    root to: 'welcome#index', as: :user_root
  

  get 'users/new'

  # authenticated do
  #   root to: 'welcome#index', as: :user_root
  # end

  unauthenticated do
    root to: 'home#show', as: :unauthed_root
  end

end