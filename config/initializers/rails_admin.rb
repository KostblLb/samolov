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
    include_all_fields
  end

  config.model Question do
    field :text, :text
    include_all_fields
  end

  config.model Unit do
    field :summary, :ck_editor
    include_all_fields
    nestable_list true
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
  end

  config.model Homework::Meta::Subtask::Base do
    field :description, :ck_editor
    include_all_fields
    nestable_list true
  end

end
