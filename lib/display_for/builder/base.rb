module DisplayFor
  module Builder
    class Base
      attr_reader :template, :namespace, :resource_class, :html_options
      
      delegate :content_tag, :cycle, :to => :template      
      
      def initialize(html_options, template, &block)
        @template = template
        @attributes = []
        @actions = []
        @html_options = html_options
      
        block.call(self) if block_given?
      end
      
      def attribute(name, options = {}, &block)
        @attributes << Element::Attribute.new(self, name, options, &block)
      end
    
      def action(name, options = {}, &block)
        @actions << Element::Action.new(self, name, options, &block)
      end
      
      def html(name, options = {}, &block)
        @attributes << Element::Html.new(self, name, options, &block)
      end
      
    end
  end
end