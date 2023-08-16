class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :show]
  before_action :set_id_bookmark, only: [:destroy]
  # def index
  #   @bookmarks = Bookmark.where(list_id: params[:list_id])
  # end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @bookmarks = @list.bookmarks
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_id_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
