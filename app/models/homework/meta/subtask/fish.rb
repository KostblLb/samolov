module Homework
  module Meta
    module Subtask
      class Fish < Base
        field :fish_body
        field :fish_head
        
        def build_t
          super
          Homework::Subtask::Fish.new description: description, order: order
        end
      end
    end
  end
end
