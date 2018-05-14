Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  get 'pages/home', to: 'pages#home'
  
  resources :recipes
  
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
end
