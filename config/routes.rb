Rails.application.routes.draw do
  # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
get 'genres' => 'admin/genres#index'
get 'genres/:id/edit' => 'admin/genres#edit', as: 'edit_genre'
patch 'genres/:id' => 'admin/genres#update', as: 'update_genre'
post 'admin/genres' => 'admin/genres#create', as: 'create_genre'

get 'items' => 'admin/items#index'
get 'items/new'
get 'admin/items/new' => 'admin/items#new'
post 'admin/items' => 'admin/items#create', as: 'create_item'

end
