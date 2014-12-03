Rails.application.routes.draw do
  authenticated do
    root to: 'welcome#index', as: :user_root
  end

  unauthenticated do
    root to: 'home#show', as: :unauthed_root
  end

  devise_for :users
  root to: "welcome#index"
  
end
