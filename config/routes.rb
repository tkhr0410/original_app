OriginalApp::Application.routes.draw do
  get "contacts/new"
  
  devise_for :users, :controllers => {
  :registrations => "registrations",
  :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  
  resources :users, only: [:show, :index, :destroy] do
    member do
      get :following, :followers
    end
  end
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :contacts
  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/map',     to: 'static_pages#map',     via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  
end
