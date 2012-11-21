module DisplayFor
  module Builder
    class List < CollectionBase
    
      def build_row(resource)
        result = ''
        @attributes.each do |attribute|
          result << content_tag(:span, attribute.content(resource), attribute.html_options)
        end
        result << content_tag(:span, build_actions(resource)) if @actions.any?

        options = {}
        options[:id] = "#{@resource_class}_#{resource.id}".underscore if resource
        content_tag(:li, result.html_safe, options) << "\n"
      end
    
      def build_actions(resource)
        result = []
      
        @actions.each do |action|
          result << action.content(resource)
        end
      
        result.join("&nbsp;").html_safe
      end
  
      def to_s
        result = "\n".html_safe
        
        @collection.each do |resource|
          result << build_row(resource)
        end

        if @footer
          result << @footer.build_row(nil)
        end

        html_options[:class] ||= "list #{@resource_class.to_s.underscore}-list"
        content_tag(:ul, result, html_options).html_safe
      end

      def footer
        @footer = List.new(resource_class, [], html_options, template)
        yield @footer
      end

    end
  end
end