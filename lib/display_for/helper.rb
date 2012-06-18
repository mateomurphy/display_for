module DisplayFor
  module Helper
    def table_for(resource_class, collection, html_options={}, &block)
      Builder::Table.new(resource_class, collection, html_options, self, &block).to_s
    end
    
    def view_for(resource, html_options={}, &block)
      Builder::View.new(resource, html_options, self, &block).to_s
    end
    
    def csv_for(resource_class, collection, html_options={}, &block)
      Builder::Csv.new(resource_class, collection, html_options, self, &block).to_s
    end    
  end
end

ActionView::Base.send :include, DisplayFor::Helper