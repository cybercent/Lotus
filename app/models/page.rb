class Page < ActiveRecord::Base
  attr_accessible :fb_page_id, :name, :picture
  validates :name, :fb_page_id, :presence => true
end
