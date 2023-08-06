Rails.application.routes.draw do

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    #管理者用
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    get 'homes/about'
    resources :users, only: [:show, :edit] do
      get :unscribe, on: :collection
      patch :withdrawal, on: :collection
    end
    resources :roads, except: [:destroy]
  end


  namespace :admin do
    resources :users, only: [:index, :show, :edit]
    resources :roads, only: [:index, :show, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
