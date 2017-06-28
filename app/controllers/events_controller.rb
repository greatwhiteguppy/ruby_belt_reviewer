class EventsController < ApplicationController
  def show
  end

  def index
    @events_state = Event.where(state: @current_user.state)
    @events_other = Event.where.not(state: @current_user.state)
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to "/events"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to "/events"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :city, :state, :date, :user_id)
  end
end
