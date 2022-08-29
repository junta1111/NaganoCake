Rails.application.routes.draw do
  # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
get '/' => 'public/homes#top'
get '/about' => 'public/homes#about'

scope module: :public do
resources :customers
resources :items
resources :cart_items
resources :orders
end

post 'orders/confirm' => 'public/orders#confirm'

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :genres
  resources :items
  resources :customers
  resources :orders
end

get 'admin/' => 'admin/homes#top'

end
