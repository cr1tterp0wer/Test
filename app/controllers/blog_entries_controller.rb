class BlogEntriesController < ApplicationController
  before_filter :require_blog_entry, :only => [:show, :edit, :destroy]
  
 	def index
 		@blog_all = BlogEntry.all
  end

  def show
  end

  def new
    @blog_entry = BlogEntry.new
  end


  def create
    @blog_entry = BlogEntry.new(params[:blog_entry])
    @blog_entry.save!
    redirect_to blog_entry_path @blog_entry.id
  end

  def destroy
    @blog_entry.destroy
    redirect_to blog_entries_path
  end
 
 def edit
 end

protected
  def require_blog_entry
    unless @blog_entry = BlogEntry.find_by_id(params[:id])
      render :inline => 'Not found', :status => 404 and return false
    end
  end

end