module DisplayFor
  module Builder
    class Table < CollectionBase
      def build_header
        result = ''
        @attributes.each do |attribute|
          result << content_tag(:th, attribute.label(@resource_class), :class => "#{@resource_class}_#{attribute.name}".underscore)
        end
        result << content_tag(:th, "Actions", :class => 'actions') if @actions.any?

        content_tag(:thead, content_tag(:tr, result.html_safe)) << "\n"
      end
    
      def build_row(resource)
        result = ''
        @attributes.each do |attribute|
          result << content_tag(:td, attribute.content(resource), attribute.html_options)
        end
        result << content_tag(:td, build_actions(resource)) if @actions.any?

        options = {}
        options[:id] = "#{@resource_class}_#{resource.id}".underscore if resource
        content_tag(:tr, result.html_safe, options) << "\n"
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

        html_options[:class] ||= "table table-bordered table-striped #{@resource_class.to_s.underscore}-table"
        content_tag(:table, result, html_options).html_safe
      end
    end
  end
end