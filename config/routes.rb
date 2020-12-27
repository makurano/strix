Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :articles, only: %i[index new create]
end
