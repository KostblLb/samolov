module Homework
  module Meta
    class Text < Base
      include Mongoid::Document
      def build_t
        super
        Homework::Task::Text.new description: description, order: order
      end
    end

  end
end
