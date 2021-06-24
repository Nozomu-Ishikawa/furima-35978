Rails.application.routes.draw do
  devise_for :users

  #itemsコントローラについてのルーティング
  resources :items do
    resources :orders, only: [:index, :create]
  end

  #usersコントローラに対してのルーティング
  resources :users, only: :show

  #ユーザーが最初にたどり着くページ
  root to: "items#index"
end
