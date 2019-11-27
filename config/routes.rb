Rails.application.routes.draw do
  resources :users, only: :show
  devise_for :users
  root to: 'pages#landing'
  resources :categories do
    resources :articles do
      resources :reviews
      resources :reactions
    end
    resources :events
  end
end
