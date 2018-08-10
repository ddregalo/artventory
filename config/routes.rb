Rails.application.routes.draw do
  get 'artworks/index'
  root 'artworks#index'
  get 'artworks/new'
  get 'artworks/edit'

  resources :artworks
  resources :artwork
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
