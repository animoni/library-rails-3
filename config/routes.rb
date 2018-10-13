Rails.application.routes.draw do

  root 'home_page#home' 
  
  resources :books
  resources :authors
end
