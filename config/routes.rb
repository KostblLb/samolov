Rails.application.routes.draw do

  get 'landing/index'

  devise_for :users
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :users,             only: [:index, :show, :update]
      resources :messages,          only: [:index, :show, :create]
      resources :courses,           only: [:index, :show]
      resources :groups,            only: [:index, :show]
      resources :parts,             only: [:index, :show]
      resources :units,             only: [:index, :show]
      resources :adverts,           only: [:index, :show, :create, :destroy]
      resources :exams,             only: [:index, :show]
      resources :questions,         only: [:index, :show]
      resources :answers,           only: [:index, :show]
      resources :quizzes,           only: :show
      resources :quiz_progresses,   only: :show
      resources :user_answers,      only: :create
      resources :unit_progresses,   only: [:show, :update]
      resources :homework_metas
      resources :homework_meta_tasks
    end
  end

  get 'cabinet' => 'cabinet#index'
  get 'temporary/index'

  root 'cabinet#index'

end
