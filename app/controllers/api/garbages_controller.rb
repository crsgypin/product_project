class Api::GarbagesController < ApplicationController
  before_action :set_garbage, :only=>[:show, :edit, :update, :destroy]

  def index
    @garbages = Garbage.all
    respond_to do |format|
			format.json { render :json => @garbages.to_json}	
    end
  end


  def show
    respond_to do |format|
			format.json { render :json => @garbage.to_json}	
    end
  end

  def create
    @garbage = Garbage.new(garbage_params)
    if @garbage.save
	    respond_to do |format|
				format.json { render :json=>{:result=>true}.to_json}	
	    end
    else
	    respond_to do |format|
				format.json { render :json=>{:result=>false}.to_json}	
	    end
    end
  end

  def update
    if @garbage.update(garbage_params)
	    respond_to do |format|
				format.json { render :json=>{:result=>true}.to_json}	
	    end
    else
	    respond_to do |format|
				format.json { render :json=>{:result=>false}.to_json}	
	    end
    end
  end

  def destroy
    @garbage.destroy
    respond_to do |format|
			format.json { render :json=>{:result=>true}.to_json}	
    end
  end



private
  def set_garbage
    @garbage = Garbage.find(params[:id])    
  end

  def garbage_params
    params.require(:garbage).permit(:name,:description)
  end

end
