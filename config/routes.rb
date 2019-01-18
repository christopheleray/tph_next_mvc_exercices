# frozen_string_literal: true

Rails.application.routes.draw do
  # sidekiq access with authentification
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"
  root 'items#index'
  get 'home/landing_page'
  get 'users/send_offer', to: 'users#send_offer'
  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'
  resources :users
  resources :items, only: %i[index show]

  namespace 'administration' do
    get '/', to: 'items#index'
    resources :items
  end
end
