Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
  end

  get "/", to: "home#index"
  get "/search", to: "books#search"
  get "/search/results", to: "books#results"
  get "/party", to: "books#party"



  get "/:user_id", to: "books#index"
  get "/:user_id/book_list", to: "books#show"
  get "/:user_id/add_a_book", to: "books#new"

  resources :books, :except => [:update]

end
