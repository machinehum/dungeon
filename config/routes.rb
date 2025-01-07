Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  
  resources :players do
    member do
      get "roll"
      patch "roll_save"
    end
  end

  resources :game do
    post :move
    resources :game_encounterables
    resources :npc_dialogues
    resources :game_items
    resources :game_npcs
    resources :game_companions
    resources :game_shops do
      resources :shop_inventory
    end
    resources :rooms
    resources :combat do
      member do
        get "run"
      end
    end
  end
end
