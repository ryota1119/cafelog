Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/edit'
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
  resources :shops, only: [:index, :show] do
    resources :comments, only: [:create, :edit]
    namespace :owners do
      resources :shops
    end
  end
  root "shops#index"
end
