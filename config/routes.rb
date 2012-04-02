Saas::Application.routes.draw do
  devise_for :subscriptions, :controllers => {:registrations => "subscriptions"}

  root to: 'plans#index'
  resources :subscriptions
  resources :plans
  resources :jobs
  resources :inventories

  match '/jobs/:customer_name/inventory' => 'inventories#new'
  
  match '/jobs/:customer_name/inventory/:inventory_name' => 'inventories#show'

end
