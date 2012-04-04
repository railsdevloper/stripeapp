Saas::Application.routes.draw do
  devise_for :subscriptions, :controllers => {:registrations => "subscriptions"}

  root to: 'plans#index'
  resources :subscriptions
  resources :plans

  resources :inventories

  resources :jobs do
    member do
      post 'add_status'
    end
  end


  match '/jobs/:customer_name/inventory' => 'inventories#new'
  
  match '/jobs/:customer_name/inventory/:inventory_name' => 'inventories#show'

end
