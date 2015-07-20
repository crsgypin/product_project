class Api::EventsController < ApplicationController

  before_action :set_event, :only=>[:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  def index
    @events = Event.all
    respond_to do |format|
			format.json { render :json => @events.to_json}	
    end
  end


  def show
    respond_to do |format|
			format.json { render :json => @event.to_json}	
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
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
    if @event.update(event_params)
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
    @event.destroy
    respond_to do |format|
			format.json { render :json=>{:result=>true}.to_json}	
    end
  end



private
  def set_event
    @event = event.find(params[:id])    
  end

  def event_params
    params.require(:event).permit(:fb_uid, :category, :range_time, :start_date, :end_date, :url, :fb_post_id, :status, :result_attributes=>[:description])
  end


end
