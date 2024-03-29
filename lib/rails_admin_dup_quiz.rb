require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminDupQuiz
end

module RailsAdmin
  module Config
    module Actions
      class DupQuiz < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          bindings[:object].is_a?(Quiz)
        end

        register_instance_option :link_icon do
          'icon-share'
        end

        register_instance_option :member do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @object.dup!
            flash[:notice] = 'Quiz has been duplicate'
            redirect_to back_or_index
          end
        end
      end
    end
  end
end