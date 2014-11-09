Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resource :todo_list do
    resources :todo_items do
    	member do
    		patch :complete
    	end
    end
  end

  root "welcome#index"
end
