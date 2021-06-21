Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end

  #get '/articles', to: 'articles#index'
  # Users 
  get '/signup', to: 'users#new'
  get '/user/articles', to: 'articles#user_index'
  resources :users

  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
