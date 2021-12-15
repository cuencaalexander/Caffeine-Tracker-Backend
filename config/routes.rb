Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :drinks, only: [:index, :create]
      get '/my_drinks', to: 'drinks#my_drinks'
      get '/users', to: 'drinks#users'
      delete '/delete_user', to: 'drinks#delete_user'
      delete '/drinks', to: 'drinks#destroy'
    end
  end
end
