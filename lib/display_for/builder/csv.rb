module DisplayFor
  module Builder
    class Csv < CollectionBase
      
      def build_header
        @attributes.map { |attribute| quote(attribute.label(@resource_class)) }.join(',').html_safe
      end
    
      def build_row(resource)
        @attributes.map { |attribute| quote(attribute.content(resource)) }.join(',').html_safe
      end
    
      def build_actions(resource)
        nil
      end
    
      def quote(string)
        "\"#{string.gsub('"', '""')}\"".html_safe
      end
  
      def to_s
        result = [build_header]
        
        @collection.each do |resource|
          result << build_row(resource)
        end

        result.join("\n").html_safe
      end
    end
  end
end