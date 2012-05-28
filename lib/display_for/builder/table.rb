module DisplayFor
  module Builder
    class Table < CollectionBase
      def build_header
        result = ''
        @attributes.each do |attribute|
          result << content_tag(:th, attribute.label(@resource_class), :class => attribute.name)
        end
        result << content_tag(:th, "Actions", :class => 'actions') if @actions.any?

        content_tag(:thead, content_tag(:tr, result.html_safe)) << "\n"
      end
    
      def build_row(resource)
        result = ''
        @attributes.each do |attribute|
          result << content_tag(:td, attribute.content(resource))
        end
        result << content_tag(:td, build_actions(resource)) if @actions.any?

        content_tag(:tr, result.html_safe, :id => "#{@resource_class}_#{resource.id}".underscore) << "\n"
      end
    
      def build_actions(resource)
        result = []
      
        @actions.each do |action|
          result << action.content(resource)
        end
      
        result.join("&nbsp;").html_safe
      end
  
      def to_s
        result = ''.html_safe
        
        @collection.each do |resource|
          result << build_row(resource)
        end

        result = build_header + content_tag(:tbody, result)

        content_tag(:table, result, :class => "table table-bordered table-striped #{@resource_class.to_s.underscore}").html_safe
      end
    end
  end
end