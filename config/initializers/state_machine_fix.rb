module StateMachine
  module Integrations
    module Mongoid
      def define_state_initializer
        define_helper :instance, <<-end_eval, __FILE__, __LINE__ + 1
            def initialize(*)
              super do |*args|
                self.class.state_machines.initialize_states(self, :static => false)
                yield(*args) if block_given?
              end
            end

            def apply_pre_processed_defaults
              defaults = {}
              self.class.state_machines.initialize_states(self, :static => :force, :dynamic => false, :to => defaults)
              defaults.each do |attr, value|
                send(:"\#{attr}=", value) unless attributes.include?(attr) || attribute_missing?(attr)
              end
              super
            end
        end_eval
      end
    end
  end
end