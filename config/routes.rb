Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'users/sessions#new'
    post 'signin' => 'users/sessions#create'
    delete 'signout' => 'users/sessions#destroy'
  end

  root "static_pages#home"
  get "home"      => "static_pages#home"
  get "help"      => "static_pages#help"
  get "contact"   => "static_pages#contact"
  get "about"     => "static_pages#about"

  resources :users do 
    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end
  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
    resources :words
    resources :caterories
  end

  resources :caterories, only: [:index, :show]
  resources :lessons, only: [:create, :show, :index]
  resources :words, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :checks, only: :create
end
