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
    # @event = Event.new()
    # need to add name, date, city, state, associate w/current user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
