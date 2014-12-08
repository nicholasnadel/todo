class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
 	@bookmarks = Bookmark.all
  end

  def new
  	@bookmark = Bookmark.new
  end

  def show
  	@bookmark = Bookmark.find(params[:id])
  end

  def edit
  	@bookmark = Bookmark.find(params[:id])
  end

  def destroy
     @bookmark = Bookmark.find(params[:id])
     title = @bookmark.url
    
     if @bookmark.destroy
       
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to bookmarks_path
       else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end
end