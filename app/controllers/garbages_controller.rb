class GarbagesController < ApplicationController
  before_action :set_garbage, :only=>[:show, :edit, :update, :destroy]

  def index
    @garbages = Garbage.all

  end

  def show
  end

  def new
    @garbage = Garbage.new
  end

  def create
    @garbage = Garbage.new(garbage_params)
    if @garbage.save
      flash[:notice] = "You have created new garbage"
      redirect_to garbages_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @garbage.update(garbage_params)
      flash[:notice] = "You have updated garbage"
      redirect_to garbages_path      
    else
      render 'edit'
    end
  end

  def destroy
    @garbage.destroy
    redirect_to garbages_path
  end

private
  def set_garbage
    @garbage = Garbage.find(params[:id])    
  end

  def garbage_params
    params.require(:garbage).permit(:name,:description)
  end
end
