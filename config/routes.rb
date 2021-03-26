Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'

  namespace :manager do
    resources :employees, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :employees, only: [:index, :show, :edit, :update]
  end
end
