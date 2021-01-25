Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :users do
    resources :shops, only: :show
  end
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  namespace :owners do
    resources :shops
  end
  get 'home/show'
  root "home#index"
end
