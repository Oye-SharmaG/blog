Rails.application.routes.draw do
  devise_for :admin_users
  root "articles#index"

  resources :articles do
    delete :purge_image
    resources :comments
  end
  delete "article/:article_id/purge_photo", to:"articles#purge_photo", as: "pg_image"
end
