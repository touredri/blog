# frozen_string_literal: true

Rails.application.routes.draw do
  # avoid conflict with devise's logout and user/id path
  devise_scope :user do
    get 'logout', to: 'session#destroy', as: :logout
  end
  devise_for :users, controllers: { session: 'session' }
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  resources :posts, only: %i[new create] do
    resources :comments, only: %i[new create]
  end
end
