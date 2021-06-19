Rails.application.routes.draw do
  devise_for :users

  #ユーザーが最初にたどり着くページ
  root to: "items#index"
end
