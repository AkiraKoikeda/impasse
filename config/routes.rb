Rails.application.routes.draw do

  #ユーザーログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者ログイン
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー側アクション
  scope module: :public do
    root to: "roads#index"
    get 'homes/about'
    resources :users, only: [:index, :edit] do
      get :unscribe, on: :collection
      patch :withdrawal, on: :collection
    end
    resources :roads, except: [:destroy]
  end

  #管理者側アクション
  namespace :admin do
    root to: "roads#index"
    resources :users, only: [:index, :show, :edit]
    resources :roads, only: [:index, :show, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
