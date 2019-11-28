Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/home', to: 'pages#home', as: "home"
  resources :categories do
    resources :articles, except: [:new, :create] do
      resources :reviews
      resources :reactions
    end
    resources :events
  end
  resources :articles, only: [:new, :create]
end
