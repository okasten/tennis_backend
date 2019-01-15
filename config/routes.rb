Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:create, :index] do
        resources :lessons
        resources :players
        resources :conversations do
          resources :messages
        end
      end
      post '/login', to: 'auth#create'
      get '/coachprofile', to: 'coaches#profile'

      resources :players, only: [:create, :index] do
        resources :lessons
        resources :coaches
        resources :conversations do
          resources :messages
        end
      end

      resources :conversations do
        resources :messages
      end
      get '/playerprofile', to: 'players#profile'

    end
  end
end
