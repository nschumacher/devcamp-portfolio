Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  # Below are for static pages that don't have to pull anything from the db
  #get 'pages/about' this is the same as the one below it
  get 'about', to: 'pages#about', as: 'about_me'
  get 'contact', to: 'pages#contact' # this lets you put whatever you want on the left and it'll map to the path (controller action) on the right


  resources :blogs do
    member do 
      get :toggle_status
    end
  end

  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
