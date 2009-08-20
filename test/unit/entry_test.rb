require 'test_helper'

class EntryTest < ActiveSupport::TestCase
    
  test "quick fixture test" do
    e = entries(:post_entry)
    e.updated_at_will_change!
    e.save!
  end
  
  test "body" do
    body = entries(:post_entry).body
    assert_equal({:foo => :bar}, entries(:post_entry).body)
  end
end
