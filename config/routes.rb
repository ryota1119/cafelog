Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  resources :shops, only: [:index, :show] 
    namespace :owners do
      resources :shops
    end
  resources :shops do
    resources :comments, only: :create
  end
  root "shops#index"
end
