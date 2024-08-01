Rails.application.routes.draw do
  root 'forums#index'
  post '/users/:id/logon', to: 'users#logon', as: 'user_logon'
  delete '/users/logoff', to: 'users#logoff', as: 'user_logoff'
  
  # User routes
  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#delete'

  # Forum routes with nested posts and subscriptions
  resources :forums do
    resources :posts, shallow: true, except: [:index]
    resources :subscriptions, shallow: true, except: [:index]
  end

  # Subscription index route
  get '/subscriptions', to: 'subscriptions#index', as: 'subscriptions'
end
