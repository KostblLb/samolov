require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminDupUnit
end

module RailsAdmin
  module Config
    module Actions
      class DupUnit < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          bindings[:object].is_a?(Unit)
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
            flash[:notice] = 'Unit has been duplicate'
            redirect_to back_or_index
          end
        end
        register_instance_option :pjax? do
          false
        end
      end
    end
  end
end