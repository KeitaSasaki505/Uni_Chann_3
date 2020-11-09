Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "events#index"
  resources :events do
    collection do
      get 'search'
      get 'about'
    end
    resources :comments
    resources :joins do
      collection do
        # デフォルト形式をcsvに設定
        get :csv_download, defaults: { format: 'csv' }
      end
    end
  end
  resources :users
  put "/users/:id/withdrawal" => "users#withdrawal", as: 'users_withdrawal'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
