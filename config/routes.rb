# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pdf/new'
  get 'pdf/create'
  devise_for :user, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'home#index'
  get 'home/index'
  get 'artworks/index'
  get 'artworks/new'
  get 'artworks/edit'
  get 'artworks/delete'
  resources :users
  resources :artworks do
    collection do
      get :search
    end
  end
  post "generate_pdf", to: 'pdf#generate_pdf'
  post "pdf/new"
end
