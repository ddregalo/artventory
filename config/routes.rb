# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'home#index'
  get 'artworks/index'
  get 'artworks/new'
  get 'artworks/edit'
  get 'artworks/delete'
  resources :artworks do
    collection do
      get :search
    end
  end
end
