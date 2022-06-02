Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bachelorettes, only: [:show] do
    resources :contestants, only: [:index], controller: :bachelorette_contestants
  end

  resources :contestants, only: [:show]
  resources :outings, only: [:show]
end
