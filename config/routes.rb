Rails.application.routes.draw do
  resources :pages, except: [:show]

  get "/pages/:permalink" => "pages#permalink", as: :permalink

  resources :pokemons, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :generations, only: %i[index show]
  resources :types, only: %i[index show]
  resources :abilities, only: %i[index show]

  root to: "home#index"
end
