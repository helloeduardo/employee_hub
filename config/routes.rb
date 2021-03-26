Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'

end
