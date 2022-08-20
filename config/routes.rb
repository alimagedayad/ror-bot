Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/get', to: 'users#get'

  namespace :api do
      get '/users', to: 'users#get'
      get '/messages', to: 'messages#get'
  end

  telegram_webhook TelegramController
end
