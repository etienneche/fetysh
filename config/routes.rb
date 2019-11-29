Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get '/home', to: 'pages#home', as: "home"
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
  resources :events
  resources :articles, only: [:new, :create]
end



# post article/53/love
# post article/53/wtt
