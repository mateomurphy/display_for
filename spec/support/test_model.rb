class TestModel < Struct.new(:id, :first_name, :last_name)
  def self.human_attribute_name(string)
    string
  end
end