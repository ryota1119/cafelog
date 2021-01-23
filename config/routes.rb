Rails.application.routes.draw do
  devise_for :owners, skip: :all
  devise_scope :owner do
    get 'owners/sign_in' => 'owners/sessions#new', as: 'new_owner_session'
    post 'owners/sign_in' => 'owners/sessions#create', as: 'owner_session'
    delete 'owners/sign_out' => 'owners/sessions#destroy', as: 'destroy_owner_session'
    get 'owners/sign_up' => 'owners/registrations#new', as: 'new_owner_registration'
    post 'owners' => 'owners/registrations#create', as: 'owner_registration'
    get 'owners/password/new' => 'owners/passwords#new', as: 'new_owner_password'
  end
  namespace :owners do
    resources :shops
  end
  root "home#index"
end
