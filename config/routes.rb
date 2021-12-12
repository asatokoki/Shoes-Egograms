Rails.application.routes.draw do
  scope module: :admin do
    devise_for :admins, skip: [:registrations, :passwords], controllers: {
      sessions: "admins/sessions"
    }
  end


  namespace :admins do
    resources :users
    resources :egograms

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  # 下のresources :usersを先に記述していたらそこを、優先的に読み込んでしまう
  get 'users/my_page/' => 'users#my_page'

  devise_for :users

  resources :users

  resources :points, only: [:create, :new, :update]
  resources :egograms, only: [:index, :show]
  #form_tagでコントローラーで保存してるから不要
  #resources :cp_points, only: [:create, :new, :update]
  #resources :np_points, only: [:create, :new, :update]
  #resources :a_points, only: [:create, :new, :update]
  #resources :fc_points, only: [:create, :new, :update]
  #resources :ac_points, only: [:create, :new, :update]
  resources :products

end
