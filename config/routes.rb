Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:index, :show, :new,  :create] do
    # member do
    #   # post :bookmarks

    # end
    post "bookmarks", to: "bookmarks#create"
    get "bookmarks/new", to: "bookmarks#new"
    delete "bookmarks/:id", to: "bookmarks#destroy"
  end
end
