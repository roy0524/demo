class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy ]
  def index
    if params[:keyword]
      @events = Event.where( ["name like ?", "%#{params[:keyword]}%"] )
    else
      @events = Event.all
    end

    sort_by = (params[:order] == 'name' ? 'name' : 'created_at')
    @events = Event.order(sort_by).page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title ="My event list" }
    end

  end

  def new
    @event = Event.new
  end

  def show
    @page_title = @event.name
    respond_to do |format|
      format.html { @page_title = @event.name }
      format.xml
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "event was successfully updated"
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "event was successfully created"
      redirect_to events_url
    else
      render :action => :new
    end
  end

  def destroy
    flash[:alert] = "#{ @event.name } was successfully deleted"
    @event.destroy
    redirect_to events_url
  end

  def bulk_delete
  Event.destroy_all
  redirect_to events_path
  end

  def bulk_update
  ids = Array(params[:ids])
  events = ids.map{ |i| Event.find_by_id(i) }.compact

  if params[:commit] == "Publish"
    events.each{ |event| event.update( :status => "published" ) }
  elsif params[:commit] == "Delete"
    events.each{ |event| event.destroy }
  end

  redirect_to events_url
  end

  def dashboard
    @event = Event.find(params[:id])
  end

  def join
    @event = Event.find(params[:id])
    Membership.find_or_create_by( :event => @event, :user => current_user )

    redirect_to :back
  end

  def withdraw
    @event = Event.find(params[:id])
    @membership = Membership.find_by( :event => @event, :user => current_user)
    @membership.destroy

    redirect_to :back
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
