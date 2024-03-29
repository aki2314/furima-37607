Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  resources :items, only: [ :index, :new, :create, :show, :edit, :update, :destroy  ] do
    resources :purchases, only: [ :index, :create ]
  end
end
