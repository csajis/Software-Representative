Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
  resources :identity_docs
  resources :notifications
  resources :sub_alerts
  resources :subscriptions
  resources :votation_rt_results
  resources :votation_results
  resources :votation_options
  resources :comments
  resources :moderations
  resources :votes
  resources :admins
  resources :voters do
    member do 
      get 'validate_doc', to: 'voters#validate_form'
      post 'validate_doc', to: 'voters#validate_doc'
    end
  end
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :votations
  get 'myvotations', to: 'votations#myvotations', as: :'myvotations'
  get '/voters/:id/imgchange', to: 'voters#imgchange', as: :'imgchange'
  get '/votations_public/', to: 'votations#index_public', as: 'votations_public'
  get 'votations/:id/public_show/', to: 'votations#public_show', as: 'public_show'
  get '/my_subscriptions', to: 'subscriptions#index_mysubscriptions', as: 'my_subscriptions'
  post '/votations/:id/edit/hide', to: 'votations#hide', as: 'hide'
  post '/votations/:id/edit/start', to: 'votations#start', as: 'start'
  post '/votations/:id/edit/publish', to: 'votations#publish', as: 'publish'
  post '/votations/:id/edit/end', to: 'votations#end', as: 'end'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "votations#index"
end
