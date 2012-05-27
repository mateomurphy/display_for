module DisplayFor
  module Element
    class Action < Base
      def content(resource)
        super || link_to(label, resource)
      end
    end
  end
end