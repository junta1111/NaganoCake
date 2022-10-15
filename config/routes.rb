Rails.application.routes.draw do
  # URL /customers/sign_in ...

scope module: :public do
resource :customers
resources :items
delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
resources :cart_items
get 'orders/complete' => 'orders#complete'
resources :orders
resources :addresses
end

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
root to: 'public/homes#top'
get '/about' => 'public/homes#about'

get 'customers/unsubscribe' => 'public/customers#unsubscribe'
patch 'customers/withdraw' => 'public/customers#withdraw'

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
