Rails.application.routes.draw do
  devise_for :users

  resources :tickets

  root to: "tickets#index"

  get "/update_categories" => "categories#update_categories"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
