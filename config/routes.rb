Rails.application.routes.draw do
  get 'articles/new'

  get 'articles/show'

  root 'static_page#home'
  get  '/signup',  to: 'users#new'
  resources :users
end
