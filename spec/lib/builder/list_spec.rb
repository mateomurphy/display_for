require 'spec_helper'

LIST_OUTPUT = %q|<ul class="list test_model-list">
<li id="test_model_1"><span>1</span><span>foo</span><span>bar</span></li>
<li><span>&nbsp;</span></li>
</ul>|

module DisplayFor
  module Builder
    describe List, :focus => true do 

      subject :table do
        List.new(TestModel, [TestModel.new(1, 'foo', 'bar')], {}, TestTemplate.new) do |t|
          t.attribute :id
          t.attribute :first_name
          t.attribute :last_name
          t.footer do |f|
            f.html :form do
              '&nbsp;'.html_safe
            end
          end          
        end
      end

      describe '#to_s' do
        it 'renders the table' do
          table.to_s.should eq(LIST_OUTPUT)
        end
      end

    end
  end
end