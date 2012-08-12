module DisplayFor
  module Builder
    class CollectionBase < Base
      attr_reader :collection
      
      def initialize(resource_class, collection, html_options, template, &block)
        @collection = collection
      
        if resource_class.is_a?(Array)
          @namespace = resource_class
          @resource_class = @namespace.pop
        else
          @namespace = []
          @resource_class = resource_class
        end
      
        super(html_options, template, &block)
      end
      
      def default_actions
        action :show
        action :edit, :link_to => lambda { |r| [:edit] + @namespace + [r] }
        action :delete, :method => :delete, :confirm => "Are you sure?"
      end
    end
  end
end