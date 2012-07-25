require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should not save page without facebook page id" do
    page = Page.new(:name => 'Test page')
    assert !page.save
  end
  
  test "should not save page without name" do
    page = Page.new(:fb_page_id => '123')
    assert !page.save
  end
end
