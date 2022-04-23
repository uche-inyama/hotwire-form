Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :discussions do
    resources :posts, only: [:create, :edit, :update, :destroy], module: :discussions

    collection do
      get 'category/:id', to: "categories/discussions#index", as: :category
    end
  end
  root to: "main#index"
end
