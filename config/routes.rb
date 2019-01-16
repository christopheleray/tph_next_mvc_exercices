# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#landing_page'
  devise_for :admins
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'

  namespace 'administration' do
    get '/', to: 'items#index'

    resources :items
    resources :users
  end
end
