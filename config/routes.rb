Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  get 'cp_points/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  devise_for :users
  resources :users

  resources :points, only: [:create, :new, :update]
  resources :egograms
  #form_tagでコントローラーで保存してるから不要
  #resources :cp_points, only: [:create, :new, :update]
  #resources :np_points, only: [:create, :new, :update]
  #resources :a_points, only: [:create, :new, :update]
  #resources :fc_points, only: [:create, :new, :update]
  #resources :ac_points, only: [:create, :new, :update]
  resources :products

end
