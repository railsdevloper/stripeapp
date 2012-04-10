Saas::Application.routes.draw do
  devise_for :subscriptions, :controllers => {:registrations => "subscriptions", :sessions => "sessions"}

  root to: 'plans#index'

  resources :subscriptions do 
    member do 
      get 'cancel'
    end
  end

  resources :plans do 
    collection do 
      get 'pricing'
    end
  end
  resources :inventories
  resources :jobs 
  resources :billings

  match "/jobs/:customer_name/inventory" => "inventories#new"
  match "/jobs/:customer_name/inventory/:inventory_name" => "inventories#show"

  match "/add_status/:job_id" => "jobs#add_status"
  match "/add_situation/:inventory_id" => "inventories#add_situation"

end
