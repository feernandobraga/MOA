class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.member = current_member

    if @event.save
      flash[:success] = "Event was successfully published"
      redirect_to events_path
    end

  end # end create


  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = "Event was successfully updated"
      redirect_to events_path

    else
      flash[:alert] = "Something went wrong..."
      render 'edit'

    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    flash[:notice] = "Event was successfully deleted!"
    redirect_to events_path

  end # end destroy

  private

  def event_params
    params.require(:event).permit( :title, :address, :meeting_point, :time, :description)
  end


end
