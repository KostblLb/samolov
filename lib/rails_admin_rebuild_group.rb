require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminRebuildGroup
end

module RailsAdmin
  module Config
    module Actions
      class RebuildGroup < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          bindings[:object].is_a?(Group)
        end

        register_instance_option :link_icon do
          'icon-refresh'
        end

        register_instance_option :member do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @object.rebuild!
            flash[:notice] = 'Group has been rebuilded!'
            redirect_to back_or_index
          end
        end
      end
    end
  end
end