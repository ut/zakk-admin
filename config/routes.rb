Rails.application.routes.draw do


  resources :pages, only: [:show]


  mount RedactorRails::Engine => '/redactor_rails'

  resources :locations

  resources :posts do
    get :copy, on: :member
  end

  resources :programs, only: [:index, :show]

  devise_for :users

  root to: 'home#index'

  get   'bomb'        => 'home#bomb', :as => :bomb
  get   'home/index'
  match 'preferences' => 'preferences#edit', :as => :preferences, via: [:get, :patch]

  namespace :admin do
    resources :users do
      get :undelete, on: :member
    end
    resources :programs
    resources :pages
    resources :contents
  end

end
