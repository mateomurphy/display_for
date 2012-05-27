module DisplayFor
  module Builder
    autoload :Base,           'display_for/builder/base'
    autoload :CollectionBase, 'display_for/builder/collection_base'
    autoload :Csv,            'display_for/builder/csv'
    autoload :ResourceBase,   'display_for/builder/resource_base'
    autoload :Table,          'display_for/builder/table'
    autoload :View,           'display_for/builder/view'
  end
end