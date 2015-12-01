TechReviewSite::Application.routes.draw do
  
  devise_for :users
  resources :users, only: :show
  resources :products, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'products#index'

  # get 'products' => 'products#index'
  # get '/products/:product_id/reviews/new' => 'reviews#new'
  # post 'products:product_id/reviews' => 'reviews#create'
  # get 'products/search' => 'products#search'
  # get 'products/:id'  =>'products#show'

end
