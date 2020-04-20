Rails.application.routes.draw do
  resources :events
  devise_for :members
  root to: "entries#index"

  resources :members
  resources :attendances
  resources :entries



  get 'remove_from_app/:id', to: 'members#remove_from_app', as: 'app_removal'

  get 'pending', to: 'members#display_pending'
  get 'approve_access/:id', to: 'members#approve_access', as: 'approve'
  delete 'deny_access/:id', to: 'members#deny_access', as: 'deny'
  get 'search_member', to: 'members#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
