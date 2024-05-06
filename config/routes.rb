# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"
  
  namespace :admin do
    resources :posts
    resources :likes
    resources :users
    resources :contacts

    root to: 'posts#index'
  end

  resources :infos, only: %i[index create]

  resources :likes, only: :index

  resources :rooms, only: %i[create index show]
  resources :messages, only: [:create]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'appearance', to: 'dashboard#appearance'
  
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get ':id', to: 'dashboard#show', as: :user

  resources :posts do
    resource :likes

    member do
      get 'update_updated_at', to: 'dashboard#update'
    end
  end

  resources :tags, only: [:show]
  resources :contacts, only: %i[new create]

end
