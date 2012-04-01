Saas::Application.routes.draw do
  root to: 'plans#index'
  resources :subscriptions
  resources :plans
  resources :jobs
  resources :inventories
end
