Cv::Application.routes.draw do
  resources :users

  root to: 'static_pages#home'
  get "static_pages/home"
end
