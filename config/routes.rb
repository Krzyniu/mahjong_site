Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles do
    resources :comments
  end

  resources :user

  resources :matches

  root 'welcome#index'
end