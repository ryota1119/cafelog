Rails.application.routes.draw do
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
