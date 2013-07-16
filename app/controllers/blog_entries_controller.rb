class BlogEntriesController < ApplicationController
   	def index
   		@blog_all = BlogEntry.all
	  end

    def show
		  unless @blog_entry = BlogEntry.find_by_id(params[:id])
	      render :inline => "Not found", :status => 404
	    end
    end

    def create
      @blog_entry = BlogEntry.new(params[:blog_entry])
    	@blog_entry.save

      redirect_to :blog_entries 
    end

    def destroy
      @del_entry = BlogEntry.find(params[:id])
      @del_entry.destroy

      redirect_to :blog_entries
    end
end