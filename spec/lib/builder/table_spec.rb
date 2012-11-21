require 'spec_helper'

TABLE_OUTPUT = %q|<table class="table table-bordered table-striped test_model-table"><thead><tr><th class="col_id">id</th><th class="col_first_name">first_name</th><th class="col_last_name">last_name</th></tr></thead>
<tbody>
<tr id="test_model_1"><td>1</td><td>foo</td><td>bar</td></tr>
</tbody><tfoot><tr><td colspan="3">&nbsp;</td></tr>
</tfoot></table>|

module DisplayFor
  module Builder
    describe Table, :focus => true do 
      context 'when given a footer' do
        subject :table do
          Table.new(TestModel, [TestModel.new(1, 'foo', 'bar')], {}, TestTemplate.new) do |t|
            t.attribute :id
            t.attribute :first_name
            t.attribute :last_name
            t.footer do |f|
              f.html :form, :html => { :colspan => 3 } do
                '&nbsp;'.html_safe
              end
            end
          end
        end

        describe '#to_s' do
          it 'renders the table' do
            table.to_s.should eq(TABLE_OUTPUT)
          end
        end
      end
    end
  end
end
