Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :articles, only: %i[index new create show edit update destroy] do
    collection do
      get 'search'
    end
  end
  resources :profiles, only: [:show, :edit, :update]
end
