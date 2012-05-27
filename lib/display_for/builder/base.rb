module DisplayFor
  module Builder
    class Base
      attr_reader :template, :namespace, :resource_class
      
      delegate :content_tag, :cycle, :to => :template      
      
      def initialize(template, &block)
        @template = template
        @attributes = []
        @actions = []
      
        raise "invalid resource class #{resource_class}" unless resource_class.respond_to?(:human_attribute_name)
      
        block.call(self)
      end
      
      def attribute(name, options = {}, &block)
        @attributes << Element::Attribute.new(self, name, options, &block)
      end
    
      def action(name, options = {}, &block)
        @actions << Element::Action.new(self, name, options, &block)
      end
      
    end
  end
end