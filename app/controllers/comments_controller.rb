class CommentsController < ApplicationController
    def index
      @post ||= BlogEntry.all
    end

    def create
       @blog_entry = BlogEntry.find_by_id(params[:blog_entry_id]) 
       @blog_entry.comments.create(params[:comment].permit(:commenter, :body))
       
       redirect_to blog_entry_path(@blog_entry)
    end

    def show
      @post = BlogEntry.find_by_id(params[:post_id])
    end

    def update
    end

    def destroy
      @blog_entry = BlogEntry.find_by_id(params[:blog_entry_id])
      @comment    = @blog_entry.comments.find_by_id(params[:id])
      @comment.destroy

      redirect_to blog_entry_path(@blog_entry)
    end
end
