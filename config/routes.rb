Rails.application.routes.draw do
  resources :events
  devise_for :members
  root to: "welcome#index"

  resources :members
  resources :attendances
  resources :entries

  # API Routes
  namespace :api do
    namespace :v1 do
      #resources :events
      get 'events', to: 'events#index'
      get 'sessions', to: 'sessions#index'
      post 'sessions', to: 'sessions#create'
      delete 'sessions', to: 'sessions#destroy'
      get 'news', to: 'entries#index'

    end
  end
  # END API routes



  get 'remove_from_app/:id', to: 'members#remove_from_app', as: 'app_removal'

  get 'pending', to: 'members#display_pending'
  get 'approve_access/:id', to: 'members#approve_access', as: 'approve'
  delete 'deny_access/:id', to: 'members#deny_access', as: 'deny'

  get 'search_member', to: 'members#search'
  get 'access_level', to: 'members#access_level'
  get 'make_trip_coordinator/:id', to: 'members#make_trip_coordinator', as: 'make_tc'
  get 'make_membership_admin/:id', to: 'members#make_membership_admin', as: 'make_ma'
  get 'make_administrator/:id', to: 'members#make_administrator', as: 'make_ad'
  get 'deny_trip_coordinator/:id', to: 'members#deny_trip_coordinator', as: 'deny_tc'
  get 'deny_membership_admin/:id', to: 'members#deny_membership_admin', as: 'deny_ma'
  get 'deny_administrator/:id', to: 'members#deny_administrator', as: 'deny_ad'
  get 'search_leader', to:'attendances#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
