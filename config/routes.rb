Rails.application.routes.draw do

  namespace :admin do
    resources :programs
  end
  mount RedactorRails::Engine => '/redactor_rails'

  resources :locations

  resources :posts

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
  end

end
