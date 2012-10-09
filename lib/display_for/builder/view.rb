module DisplayFor
  module Builder
    class View < ResourceBase
      attr_reader :template
    
      def build_header
        result = ''

        result << content_tag(:th, "Attribute")
        result << content_tag(:th, "Value")

        content_tag(:thead, content_tag(:tr, result.html_safe)) << "\n"
      end    
    
      def build_row(attribute)
        result = ''.html_safe
        result << content_tag(:th, attribute.label(resource_class))
        result << content_tag(:td, attribute.content(resource))
        content_tag(:tr, result.html_safe)
      end
    
      def build_actions
        result = []
      
        @actions.each do |action|
          result << action.content(resource)
        end
      
        content_tag(:tr) do
          content_tag(:td, result.join("&nbsp;").html_safe, :colspan => 2)
        end
        
      end
  
      def to_s
        result = build_header
        
        @attributes.each do |attribute|
          result << build_row(attribute)
        end
        
        result << build_actions

        html_options[:class] = "table table-bordered table-striped #{@resource_class.to_s.underscore}-view"
        content_tag(:table, result, html_options).html_safe
      end
    end
  end
end