Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'coaches#profile'
    end
  end
end
