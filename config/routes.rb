Rails.application.routes.draw do
  devise_for :members
  root to: "news#index"

  resources :members, only: [:index, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
