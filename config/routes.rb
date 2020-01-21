Rails.application.routes.draw do
  get 'articles/new'

  get 'articles/show'
  get '/publish', to: 'articles#new'
  get 'articles', to: 'articles#show'
  resources :articles

  root 'articles#show'
  get  '/signup',  to: 'users#new'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
