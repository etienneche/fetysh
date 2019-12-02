Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/home', to: 'pages#home', as: "home"
  get '/results', to: 'pages#results', as: "results"

  resources :categories do
    resources :articles, except: [:new, :create] do
      resources :reviews
      member do
        post 'love', to: 'reactions#love'
        post 'wtt', to: 'reactions#wtt'
        post 'save', to: 'reactions#save'
      end
    end
  end

  resources :events do
    resources :ratings
  end
  resources :articles, only: [:new, :create]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: 'https://fetysh.club/stripe-webhooks'
end

# post article/53/love
# post article/53/wtt
