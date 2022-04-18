Rails.application.routes.draw do
  devise_for :users
  resources :discussions do
    resources :posts, only: [:create], module: :discussions
  end
  root to: "main#index"
end
