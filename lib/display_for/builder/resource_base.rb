module DisplayFor
  module Builder
    class ResourceBase < Base
      attr_reader :resource
      
      def initialize(resource, html_options, template, &block)
        if resource.is_a?(Array)
          @namespace = resource
          @resource = @namespace.pop
        else
          @namespace = []
          @resource = resource
        end      

        @resource_class = @resource.class
      
        super(html_options, template, &block)
      end
      
      def default_actions
        action :list, :link_to => lambda { |r| @namespace + [@resource_class]}, :class => 'btn btn-small'
        action :edit, :link_to => lambda { |r| [:edit] + @namespace + [r] }, :class => 'btn btn-small'
        action :delete, :method => :delete, :confirm => "Are you sure?", :class => 'btn btn-small btn-danger'
      end
    end
  end
end