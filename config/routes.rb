Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
  }
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, except: [:destroy]
    resources :pets, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :update] do
      resources :comments, only: [:destroy]
    end
    resources :questions, only: [:index, :show, :edit, :update] do
      resources :answers, only: [:destroy]
    end
  end
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  
  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes/about', as: 'about'
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    
    resources :pets, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :create, :show, :edit, :update, :destroy] do
      resources :favorites, only: [:index, :create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
    resources :questions, only: [:index, :create, :show, :edit, :update, :destroy] do
      resource :answers, only: [:create, :destroy]
    end
  end
  
end
