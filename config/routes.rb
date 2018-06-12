Rails.application.routes.draw do
  devise_for :users
  root 'storefront#all_items'
  
  get 'categorical' => 'storefront#items_by_category'
  get 'branding' => 'storefront#items_by_brand'
  
  resources :categories
  resources :products
  
end
