class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @lists = list.where("name LIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @lists = List.all
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :img_url)
  end
end
