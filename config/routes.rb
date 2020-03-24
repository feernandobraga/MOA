Rails.application.routes.draw do
  devise_for :members
  root to: "news#index"

  resources :members

  get 'remove_from_app/:id', to: 'members#remove_from_app', as: 'app_removal'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
