Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  # get '/users',to:'users#index'
  # get '/users/:id',to:'user#show'
  # post 'users/',to:'users#create'
  # delete 'users/:id',to:'users#destory'
  # patch 'users/:id',to:'users#update'
  resource :users
  get '/users/me', to: 'users#me'
  resource :sessions, only: [:create, :destory]
end
