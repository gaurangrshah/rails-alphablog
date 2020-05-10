Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'welcome/home', to: 'welcome#home'
  root 'pages#home' # home page served from root path

  # about page from pages path
  get 'about', to: 'pages#about' 
end
