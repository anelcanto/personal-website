# frozen_string_literal: true

Rails.application.routes.draw do
  resources :leads
  resources :blog_posts

  get 'pages/home', to: 'pages#home', as: :home
  get 'pages/terms', to: 'pages#terms', as: :terms
  get 'pages/privacy', to: 'pages#privacy', as: :privacy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Non resource routes:
  get 'my_posts', to: 'blog_posts#my_posts', as: :my_posts
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
