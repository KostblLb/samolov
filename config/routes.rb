Rails.application.routes.draw do

  namespace :api do
  namespace :v1 do
    get 'conversation/view'
    end
  end

  get 'landing/directors'
  get 'landing/history'
  get 'landing/founders'
  get 'landing/samolov'
  get 'landing/index'
  get 'landing/blog'


  devise_for :users
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :users,             only: [:index, :show, :update]
      resources :conversations,     only: [:index, :show, :create, :update, :destroy] do
        member do
          get 'view'
        end
      end
      resources :courses,           only: [:index, :show]
      resources :course_progresses, only: [:show]
      resources :scales,            only: [:index, :show, :create, :update]
      resources :groups,            only: [:index, :show, :update]
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
      resources :orders,            only: [:show, :create]
      resources :homework_metas
      resources :homework_progresses
      resources :faqs,              only: [:show, :index]


      # Should be subresources of profile. but emberjs not suppored it.
      resources :messages,          only: [:destroy, :show, :create]
      # end subresource of profile

    end
  end

  get 'cabinet' => 'cabinet#index'
  get 'temporary/index'



  root 'cabinet#index'

end
