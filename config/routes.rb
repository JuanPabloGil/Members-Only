Rails.application.routes.draw do
  get 'users/new'

  get 'static_page/home'
  root 'static_page#home'
  get  '/signup',  to: 'user#new'
  post '/signup',  to: 'user#create'
  resources :user

end
