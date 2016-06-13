class Page < ActiveRecord::Base
  attr_accessible :fb_page_id, :name, :picture
  validates :name, :fb_page_id, :presence => true

  def is_new?
    return false
  end

  def badNAme
    "some bad page name"
  end

  def complexity
    (1..2).each do |i|
    puts i
    end
  end
end
