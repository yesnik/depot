require './scripts/store'

Rails.application.routes.draw do
  match 'catalog' => StoreApp.new, via: :all

  get 'upload/get'
  get 'upload/index'
  get 'upload/show'
  post 'upload/save'
  get 'upload/picture'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new, as: 'login'
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end

  scope 'admin' do
    resources :products do
      get :who_bought, on: :member
    end
  end
end
