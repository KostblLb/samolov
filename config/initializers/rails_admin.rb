require 'rails_admin_rebuild_group'
require 'rails_admin_dup_unit'
require 'rails_admin_dup_quiz'
require 'rails_admin/config/fields/base'
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RebuildGroup)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::DupUnit)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::DupQuiz)

module RailsAdmin
  module Config
    module Fields
      module Types
        class Datetime < RailsAdmin::Config::Fields::Base
          def value
            value_in_default_time_zone = bindings[:object].send(name)
            return nil if value_in_default_time_zone.nil?
            time_zone = ActiveSupport::TimeZone.new('Moscow')
            value_in_default_time_zone.in_time_zone(time_zone)
          end
        end
      end
    end
  end
end

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    rebuild_group
    dup_unit
    dup_quiz
    nestable

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end



  config.model Answer do

    parent Quiz
    field :id
    field :text, :text
    field :is_correct
    field :position
    field :question
  end

  config.model Question do
    field :id
    field :text, :ck_editor
    parent Quiz
    field :answers
    field :position
    field :quiz
    field :user_answers
  end

  config.model UserAnswer do
    parent Quiz
  end

  config.model QuizProgress do
    parent Quiz
    field :id
    field :user
    field :quiz
    field :current_question_number
    field :current_question
    field :user_answers
    field :quiz_progress_socket
    field :case_progress_socket
  end

  config.model Quiz do
    navigation_label 'Тесты и кейсы'
    exclude_fields :quiz_progresses
    weight -3
  end

  config.model Part do
    parent Course
    exclude_fields :course_part_progresses
  end

  config.model Scale do
    parent Course
  end

  config.model CourseProgress do
    parent Course
    visible false
  end

  config.model CoursePartProgress do
    parent Course
    visible false
  end

  config.model UnitProgress do
    field :id
    field :user
    field :unit
    field :video_complete
    field :summary_complete
    field :webinar_complete

    field :webinar_score
    field :quiz_progress
    field :case_progress
    field :homework_progress
    parent Course
  end

  config.model Course do
    navigation_label 'Курсы'
    weight -4
    exclude_fields :course_progresses
  end

  config.model Unit do
    field :summary, :ck_editor
    include_all_fields
    nestable_list true
    parent Course
  end

  config.model Admin do
    parent User
  end

  config.model Group do
    parent User
    include_all_fields
    exclude_fields :course_progresses
    field :education_beginning
  end

  config.model Conversation do
    visible false
    parent User
  end

  config.model Subscribtion do
    parent User
  end

  config.model User do
    navigation_label 'Пользователи'
    weight -5
    field :id
    field :email
    field :first_name
    field :last_name
    field :groups
    field :trained_groups

    field :city
    field :country
    field :company_name
    field :job_title
    field :phone
    field :skype


    field :vk_link
    field :fb_link
    field :gplus_link
    field :ln_link
    field :tw_link
    field :avatar

    field :orders
    field :course_progresses
    field :course_part_progresses
    field :unit_progresses
    field :quiz_progresses
    field :user_answers

    field :my_homeworks
    field :students_homeworks
    field :conversations
    field :subscribtion
    field :sign_in_count

    field :birthday
    field :last_sign_in_at

  end

  config.model Faq do
    field :question, :ck_editor
    field :answer, :ck_editor
    include_all_fields
    nestable_list true
  end

  config.model Homework::Meta::Task do
    field :description, :ck_editor
    include_all_fields
    nestable_list true
    navigation_label 'Задания ДЗ'
    weight -2
  end

  config.model Homework::Meta::Subtask::Base do
    field :description, :ck_editor
    include_all_fields
    nestable_list true
    navigation_label 'Подзадания ДЗ'
    weight -1
  end

  config.model Homework::Meta::Subtask::Option do
    navigation_label 'Подзадания ДЗ'
    weight -1
  end

  config.model Homework::Meta::Subtask::Row do
    navigation_label 'Подзадания ДЗ'
    weight -1
  end

  config.model Homework::Meta::Progress do
    visible false
  end

  config.model Homework::Progress do
    parent Course
    exclude_fields :tasks, :is_complete
  end

  config.model Faq do
    navigation_label 'Сайт'
    weight -6
  end

  config.model Inquire do
    navigation_label 'Сайт'
    include_all_fields
    field :created_at
  end

  config.model Order do
    navigation_label 'Сайт'
    include_all_fields
    field :created_at
    field :updated_at do
      hide
    end
  end

end
