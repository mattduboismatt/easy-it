Rails.application.routes.draw do
  devise_for :users

  resources :tickets

  get "/update_categories" => "services#update_categories"

  root to: "tickets#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
