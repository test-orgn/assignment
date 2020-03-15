Rails.application.routes.draw do
  
  get 'users/index'
  get 'users/show'
  devise_for :users
  root 'questions#index'
  
  resources :questions do
    resources :answers
    
  end
  resources :topics do
    collection do
      post :follow
      post :unfollow
    end
  end
  
  resources :users do
    collection do
      post :follow
      post :unfollow
    end
    get :followers
    get :followings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
