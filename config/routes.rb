Cv::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'
  get "static_pages/home"
  match "signin", to: "sessions#new"
end
