Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :activities, only: [:index, :destroy]
  
  resources :campers, only: [:show, :index, :create]
  
  resources :signups, only: [:create] do
    resources :activities, only: [:index, :show]
  end
end
