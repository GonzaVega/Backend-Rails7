Rails.application.routes.draw do
  resources :conferences
  root 'home#index'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'search/users', to: 'users#search'
  get 'search/conferences', to: 'conferences#search'
end
