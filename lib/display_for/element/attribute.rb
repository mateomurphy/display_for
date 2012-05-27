module DisplayFor
  module Element
    class Attribute < Base
      def default_label(resource_class)
        resource_class.human_attribute_name(@name.to_s)
      end
    
      def content(resource)
        if @block
          @block.call(resource)
        else
          value(resource)
        end
      end
    
      def value(resource)
        raise "#{resource.class} does not respond to #{@name}" unless resource.respond_to?(@name)
        
        result = resource.send(@name) 
        
        if @options[:type]
          if @options[:type] == :html
            result = result.html_safe
          else
            result = template.send(:"number_to_#{@options[:type]}", result)
          end
        end
        
        if [Date, DateTime, Time].include?(result.class) &&  @options[:format]
          result = template.l(result, :format => @options[:format])
        end
        
        result = link_to(result, resource) if @options[:link_to]
        result.to_s
      end
    
      def template
        @builder.template
      end
    
    end
  end
end