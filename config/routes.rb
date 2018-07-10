Rails.application.routes.draw do
  resources :feedbacks
  devise_for :users

  root to: "feedbacks#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
