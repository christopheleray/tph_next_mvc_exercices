# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'
  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/create'
  # get 'categories/update'
  resources :users
  resources :items, only: %i[index show]

  namespace 'administration' do
    get '/', to: 'items#index'
    resources :items
  end
end
