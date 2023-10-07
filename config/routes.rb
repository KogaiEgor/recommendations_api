Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :consultation_requests, only: [:create] do
        resources :recommendations, only: [:create]
      end
      resources :patients, only: [] do
        resources :recommendations, only: [:index], controller: 'patients/recommendations'
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
