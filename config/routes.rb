Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :coaches, only: [:create, :index, :update] do
        resources :lessons
        resources :players
        resources :conversations do
          resources :messages
        end
      end
      post '/login', to: 'auth#create'
      get '/coachprofile', to: 'coaches#profile'
      get '/coaches/:coach_id/students', to: 'coaches#students'
      get '/conversations/:id/markRead', to: 'conversations#markRead'
      get '/conversations/unreadmessages/:user_id/:type', to: "conversations#unread"
      patch '/goals/:id', to: 'goals#update'
      delete '/goals/:id', to: 'goals#delete'
      patch '/goals/:id/meet', to: 'goals#meet'
      get '/goals/:id', to: 'goals#index'
      get '/usergoals/:id', to: 'goals#usergoals'
      patch '/lessons/:id/addNotes', to: 'lessons#addNotes'
      patch '/lessons/:id/book', to: 'lessons#book'
      resources :players, only: [:create, :index, :update] do
        resources :lessons
        resources :coaches
        resources :conversations do
          resources :messages
        end
        resources :goals
      end

      resources :conversations do
        resources :messages
      end
      get '/playerprofile', to: 'players#profile'

    end
  end
end
