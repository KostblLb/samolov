module Homework
  module Meta
    class Text < Base
      def build_t(progress)
        super
        cname.create progress: progress, description: description, order: order
      end
    end

  end
end
