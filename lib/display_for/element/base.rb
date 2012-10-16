module DisplayFor
  module Element
    class Base
      attr_reader :name
      
      def initialize(builder, name, options = {}, &block)
        @builder, @name, @options, @block = builder, name, options, block
      end
    
      def html_options
        @options[:html] || {}
      end

      def label(resource_class = nil)
        return nil if @options[:label] === false
        
        name = @options[:label] || @name.to_sym
        
        return name unless name.is_a?(Symbol)
        
        I18n.t(name, :scope => 'display_for.labels', :default => default_label(resource_class) )
      end        
        
      def default_label(resource_classs = nil)
        @name.to_s.humanize
      end
    
      def content(resource)
        if @block
          @block.call(resource)
        else
          nil
        end
      end
    
      def link_to(string, resource, html_options = {})
        url = if @options[:link_to].respond_to?(:call)
          @options[:link_to].call(resource)
        elsif @options[:link_to].is_a?(Symbol)
          @builder.template.send(@options[:link_to], resource)
        else
          @builder.namespace + [resource]
        end
      
        return nil unless url
      
        html_options[:method]  ||= @options[:method]
        html_options[:confirm] ||= @options[:confirm]
        html_options[:remote]  ||= @options[:remote]
        html_options[:class]   ||= @options[:class]
      
        @builder.template.link_to(string, url, html_options)
      end
    end
  end
end