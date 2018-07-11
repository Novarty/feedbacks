Rails.application.routes.draw do
  resources :feedbacks, only: [:index, :new, :create]
  devise_for :users

  root to: "feedbacks#new"
end
