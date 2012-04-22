Saas::Application.routes.draw do
  devise_for :subscriptions, :controllers => {:registrations => "subscriptions", :sessions => "sessions"}

  as :subscriptions do
    get "/signup/:plan_name" => "subscriptions#new"
  end

  root to: 'plans#index'

  resources :subscriptions

  resources :plans

  resources :billings, :path => "/:username/billing" do
    collection do 
      get 'payment_info'
    end
    member do 
      get 'cancel'
    end
  end
  
  resources :insurance_companies
  resources :dashboards, :path => "/:username/dashboards"
  resources :inventories, :path => "/:username/inventories"
  resources :jobs, :path => "/:username/jobs" 
  resources :people, :path => "/:username/people"

  match "/pricing" => "plans#pricing"

  match ":username/jobs/:customer_name/inventory/new" => "inventories#new"
  match ":username/jobs/:customer_name/inventory/:inventory_name" => "inventories#show"
  match ":username/jobs/:customer_name/inventories" => "inventories#inventories"

  match ":username/jobs/:customer_name/add_status" => "jobs#add_status"
  match ":username/jobs/:customer_name/inventory/:inventory_name/add_status/:inventory_id" => "inventories#add_situation", :via => :post

end
