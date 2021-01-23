Rails.application.routes.draw do
  devise_for :owners, controller: {
    sessions: 'owners/sessions'
  }
  get 'home/index'
  get 'home/show'
  root "shops#index"
  resources :shops
end
