Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/home', to: 'pages#home', as: "home"
  resources :categories do
    resources :articles, except: [:new, :create] do
      resources :reviews, only: [:new, :create]
      resources :reactions
    end
  end
  resources :events
  resources :articles, only: [:new, :create]
end
