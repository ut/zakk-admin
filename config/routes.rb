Rails.application.routes.draw do



  resources :pages, only: [:show]


  # mount RedactorRails::Engine => '/redactor_rails'

  resources :locations, only: [:index, :show]
  resources :posts, only: [:index, :show]
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
    resources :programs do
      get :sendmail, on: :member
    end
    resources :posts do
      get :copy, on: :member
      get :set_status, on: :member
    end
    resources :pages
    resources :contents
    resources :flyers
    resources :locations
  end

end
