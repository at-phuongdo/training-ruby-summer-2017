Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get 'register' => 'users#register'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'register' => 'users#register_action'
end
