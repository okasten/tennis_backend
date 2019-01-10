Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:create]
      post '/login', to: 'auth#create'
      get '/coachprofile', to: 'coaches#profile'
      
      resources :players, only: [:create]
      get '/playerprofile', to: 'players#profile'

    end
  end
end
