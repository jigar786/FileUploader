Rails.application.routes.draw do
  root "users#home"
  devise_for :users, :controllers => { registrations: "users/registrations", sessions: "users/sessions" }
  get "user_files/:id/download" => "user_files#download", as: "user_files_download"
  resources :user_files, only: [:create, :destroy]
  get "users/home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
