require File.dirname(__FILE__) + '/../test_helper'

class ThingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "thing_id" do
    thing = create_thing
    assert thing.id > 0
  end
  
protected
  def create_thing(options = {})
    record = Thing.new({ :title => 'pear', :description => 'anjou'  }.merge(options))
    record.save
    record
  end
  
end
