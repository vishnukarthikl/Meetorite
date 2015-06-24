Rails.application.routes.draw do
  resources :users
  get 'profile' => 'users#show', as: 'current_user'

  root 'application#root'
  get 'home' => 'static#home'

  get 'sessions/new'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'dashboard' => 'dashboard#overview', as: 'dashboard'
end
