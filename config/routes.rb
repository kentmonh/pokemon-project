Rails.application.routes.draw do
  resources :pokemons, only: %i[index show]
  resources :generations, only: %i[index show]
  resources :types, only: %i[index show]
  resources :abilities, only: %i[index show]

  root to: "home#index"
end
