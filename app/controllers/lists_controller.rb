class ListsController < ApplicationController
  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      # Render new means we are
      render :new, status:
    end
  end

  def show
    @list = List.find(params[:id])
    # Show the details of the list
  end

  private

  def list_params
    # The parameters we require, the model we are dealing with (the list) and which parameters we permit the user to add
    params.require(:list).permit(:name)
  end
end
