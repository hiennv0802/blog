Rails.application.routes.draw do

  get 'sessions/new'

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :comments, only: [:create, :destroy]
  resources :entries do
    member do
      post :all_comment
    end
  end
  resources :entries, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
