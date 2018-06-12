Rails.application.routes.draw do
  get 'cart/add_to_cart'
  get 'cart/view_order'
  get 'cart/checkout'
  devise_for :users
  root 'storefront#all_items'
  
  get 'categorical' => 'storefront#items_by_category'
  get 'branding' => 'storefront#items_by_brand'
  
  resources :categories
  resources :products
  
end
