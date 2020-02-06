Rails.application.routes.draw do
  get 'contact/new'
  get 'welcome/index'
 
  resources :articles do
    resources :comments
  end

  resources :user

  resources :leagues

  resources :matches

  resources :contacts

  root 'welcome#index'
end