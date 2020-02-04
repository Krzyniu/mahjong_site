Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles do
    resources :comments
  end

  resources :user

  resources :leagues

  resources :matches

  root 'welcome#index'
end