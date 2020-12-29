Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :events do
    collection do
      get 'search'
      get 'about'
      get 'about_me'
    end
    resources :comments
    resources :likes, only: [:create, :destroy]
    resources :joins do
      collection do
        # デフォルト形式をcsvに設定
        get :csv_download, defaults: { format: 'csv' }
      end
    end
  end

  resources :users
  put "/users/:id/withdrawal" => "users#withdrawal", as: 'users_withdrawal'
  
end
