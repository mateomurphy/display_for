module DisplayFor
  module Builder
    class ResourceBase < Base
      attr_reader :resource
      
      def initialize(resource, template, &block)
        if resource.is_a?(Array)
          @namespace = resource
          @resource = @namespace.pop
        else
          @namespace = []
          @resource = resource
        end      

        @resource_class = @resource.class
      
        super(template, &block)
      end
      
      def default_actions
        action :list, :link_to => :collection_path, :class => 'btn small'
        action :edit, :link_to => :edit_resource_path, :class => 'btn small'
        action :delete, :method => :delete, :confirm => "Are you sure?", :class => 'btn small danger'
      end
    end
  end
end