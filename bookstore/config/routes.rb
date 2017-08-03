Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books

  resources :confirmations, except: %i[new show] do
    member do
      get 'confirm' => 'confirmations#confirm_email'
    end
  end

  resource :user_actions, except: %i[new show]
  get 'register' => 'user_actions#new'
  post 'register' => 'user_actions#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :reset_passwords
  resources :carts, only: %i[show]
end
