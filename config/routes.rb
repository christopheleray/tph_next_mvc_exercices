# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'categories/index'
  get 'categories/show'
  get 'categories/create'
  get 'categories/update'
  root 'administration/items#index'

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    get '/', to: 'items#index'

    resources :items
    resources :users
  end
end
