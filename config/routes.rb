Rails.application.routes.draw do  

  
  # pages served from the views/pages directory
  root 'pages#home' 
  get 'about', to: 'pages#about' 
  
  resources :articles # sets up all paths to handle our article related endpoints

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, except: [:new]
end
