# frozen_string_literal: true

Rails.application.routes.draw do

  scope module: :public do
    get "users/edit"  => "users#edit" ,as: "edit_users"
    patch "users" => "users#update"
  end

  #ユーザーログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #管理者ログイン
  devise_for :admin, skip: [:registration, :password], controllers: {
    sessions: "admin/sessions"
  }

  #ゲストログイン
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  #ユーザー側アクション
  scope module: :public do
    root to: "roads#index"
    get "homes/about"
    resource :users, only: [:show] do
      get :unscribe, on: :collection
      patch :withdrawal, on: :collection
    end
    resources :roads do
      resources :road_comments, only: [:create, :destroy]
    end
  end

  #管理者側アクション
  namespace :admin do
    root to: "roads#index"
    resources :users, only: [:index, :show, :edit, :update]
    resources :roads, only: [:index, :show, :edit, :update, :destroy] do
      resources :road_comments, only: [:delete]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
