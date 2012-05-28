module DisplayFor
  module Element
    class Html < Base
    
      def content(resource)
        @builder.template.capture(resource, &@block)
      end
    
    end
  end
end