Rails.application.routes.draw do
  get 'users/show'
  resources :reservations
  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
    post '/users/sign_in' => 'devise/sessions#create'
    get '/users/account' => 'devise/registrations#show'
  end

  resources :users, only: [:show, :edit, :update]
  root 'home#index'
  get 'home/index'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
