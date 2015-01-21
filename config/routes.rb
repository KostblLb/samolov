Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update]
    end
  end

  get 'cabinet' => 'cabinet#index'

  devise_for :users
  get 'temporary/index'

  root 'cabinet#index'

end
