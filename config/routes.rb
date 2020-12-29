Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :articles, only: %i[index new create show edit update destroy] do
    collection do
      get 'search'
    end
  end
end
