require 'rails_admin_rebuild_group'
require 'rails_admin_dup_unit'
require 'rails_admin_dup_quiz'
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RebuildGroup)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::DupUnit)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::DupQuiz)

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
    field :text, :text
    parent Quiz
    include_all_fields
  end

  config.model Question do
    field :text, :text
    parent Quiz
    include_all_fields
  end

  config.model UserAnswer do
    parent Quiz
  end

  config.model QuizProgress do
    parent Quiz
  end

  config.model Quiz do
    navigation_label 'Тесты и кейсы'
    weight -3
  end

  config.model Part do
    parent Course
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
    parent Course
    visible false
  end

  config.model Course do
    navigation_label 'Курсы'
    weight -4
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
    visible false
  end

  config.model Faq do
    navigation_label 'Сайт'
    weight -6
  end

  config.model Inquire do
    navigation_label 'Сайт'
  end

  config.model Order do
    navigation_label 'Сайт'
  end

end
