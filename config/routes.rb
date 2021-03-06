Rails.application.routes.draw do
  root 'events#index'

  resources :events, only: [:new, :create, :show, :index]

  post 'attendances/create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
