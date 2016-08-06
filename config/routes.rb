Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  as :user do
    get 'signup' => 'users/registrations#new'
    post 'signup' => 'users/registrations#create'
    get 'edit' => "users/registrations#edit"
    get 'signin' => 'users/sessions#new'
    post 'signin' => 'users/sessions#create'
    delete 'signout' => 'users/sessions#destroy'
    resources :users, only: [:index, :show]
  end

  devise_for :users, :skip => [:sessions, :omniauth_callbacks]
  root "static_pages#home"
  get "home"      => "static_pages#home"
  get "help"      => "static_pages#help"
  get "contact"   => "static_pages#contact"
  get "about"     => "static_pages#about"
  get "signup"    => "users#new"

  resources :users do
    resources :followers, only: [:index]
    resources :followings, only: [:index]
  end

  resources :caterories
  resources :lessons, only: [:create, :show, :index]
  resources :words
  resources :relationships, only: [:create, :destroy]
  resources :checks, only: :create
end
