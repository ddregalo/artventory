# frozen_string_literal: true

Rails.application.routes.draw do
  get 'vue/index'
  devise_for :user, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get 'artworks/index'
  root 'artworks#index'
  get 'artworks/new'
  get 'artworks/edit'
  get 'artworks/delete'
  get 'vue/index'
  resources :artworks do
    collection do
      get :search
    end
  end
end
