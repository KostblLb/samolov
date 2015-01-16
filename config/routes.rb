Rails.application.routes.draw do
  get 'cabinet' => 'cabinet#index'

  devise_for :users
  get 'temporary/index'

end
