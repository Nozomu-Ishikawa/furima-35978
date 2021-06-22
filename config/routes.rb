Rails.application.routes.draw do
  devise_for :users

  resources :items

  #ユーザーが最初にたどり着くページ
  root to: "items#index"
end
