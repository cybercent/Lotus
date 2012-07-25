class PagesController < ApplicationController
  def index
    @page = Page.new
    @pages = Page.order("id DESC").limit(10)
  end
  
  def create
    @graph = Koala::Facebook::API.new(Settings.fb_oauth_key)
    begin
      @fb_page = @graph.get_object(params[:page][:fb_page_id])
    rescue Exception => e
      # puts e.message
    end
    if @fb_page
      @page = Page.find_by_fb_page_id(params[:page][:fb_page_id])
      unless @page
        @page = Page.new({:fb_page_id => @fb_page['id'], :name => @fb_page['name'], :picture => @fb_page['picture']})
        @page.save
      end
    end
    redirect_to '/'
  end
  
  def show
    @page = Page.find(params[:id])
    @graph = Koala::Facebook::API.new(Settings.fb_oauth_key)
    @feed = @graph.get_connections(@page.fb_page_id,'feed')
  end
end
