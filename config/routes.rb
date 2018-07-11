Rails.application.routes.draw do
  resources :feedbacks, only: %i[index new create]
  devise_for :users

  root to: "feedbacks#new"
end
