Rails.application.routes.draw do
  devise_for :users

  resources :resumes do
    resources :messages
  end

  resources :messages, only: [:index]

  authenticated :user do
    root 'resumes#index', as: :authenticated_root
  end

  root 'home#index'
end
