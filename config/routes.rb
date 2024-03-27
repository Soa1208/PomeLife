Rails.application.routes.draw do
  
  root 'homes#top'
  get 'homes/about' => 'homes/about', as: 'about'
  get '/search', to: 'searches#search', as: 'search'
  get 'tagsearch', to: 'tagsearches#tagsearch', as: 'tagsearch'

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :pets, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :update, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :questions, only: [:index, :show, :edit, :update, :destroy] do
      resources :answers, only: [:destroy]
    end
  end
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  
  scope module: :public do
    get 'customers/:id' =>'customers#show', as: 'customer'
    get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/:id' => 'customers#update' 
    resources :pets
    resources :posts do
      resources :favorites, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :questions do
      resources :answers, only: [:create, :destroy]
      member do
        patch 'resolve', to: 'questions#resolve'
      end
    end
  end
  
  devise_scope :customer do
    post "customers/guest_sign_in", to: "customers/sessions#guest_sign_in"
  end
end
