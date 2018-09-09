Rails.application.routes.draw do
  devise_for :user, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  get 'artworks/index'
  root 'artworks#index'
  get 'artworks/new'
  get 'artworks/edit'
  get 'artworks/delete'
  resources :artworks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
