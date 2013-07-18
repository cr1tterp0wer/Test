class BlogEntriesController < ApplicationController
   	def index
   		@blog_all = BlogEntry.all
    end

    def show
		  unless @blog_entry = BlogEntry.find_by_id(params[:id])
        render :inline => "Not found", :status => 404
      end
    end

    def new
      @blog_entry = BlogEntry.new
    end


    def create
      @blog_entry = BlogEntry.new(params[:blog_entry])
      @blog_entry.save
    
      redirect_to blog_entries_path
    end

    def destroy
      if @del_entry = BlogEntry.find_by_id(params[:id])
        @del_entry.destroy
        redirect_to blog_entries_path
      else
        render :inline => "Not found", :status => 404
      end  
    end

    def home_link
      @blog_all = BlogEntry.all
    end

end