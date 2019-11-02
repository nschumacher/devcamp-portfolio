Rails.application.routes.draw do
  resources :portfolios
  
  # Below are for static pages that don't have to pull anything from the db
  #get 'pages/about' this is the same as the one below it
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact' # this lets you put whatever you want on the left and it'll map to the path (controller action) on the right


  resources :blogs

  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
