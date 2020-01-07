Rails.application.routes.draw do
  get 'articles/new'

  get 'articles/show'
  get '/publish', to: 'articles#new'
  resources :articles

  root 'static_page#home'
  get  '/signup',  to: 'users#new'
  resources :users
end
