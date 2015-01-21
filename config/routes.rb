Rails.application.routes.draw do

  devise_for :users
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :update]
    end
  end

  get 'cabinet' => 'cabinet#index'
  get 'temporary/index'

  root 'cabinet#index'

end
