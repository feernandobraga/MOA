class Api::V1::EventsController < ApplicationController

  #before_action :authenticate_member!

  # this will allow identifying requests based on the header.
  # For example, if I pass fernando@moa.com and the token I have for that user, I can then
  # identify the current user.
  acts_as_token_authentication_handler_for Member, fallback: :none

  def index
    #byebug
    display_current_member

    if current_member
    #if true
      @events = Event.all.order(time: :asc)
      render :index, status: :ok
    else
      head(:unauthorized)
    end

  end

  def show
    if current_member
      @event = Event.find(params[:id])
      render :show, status: :ok
    else
      head(:unauthorized)
    end

  end


  private

  def display_current_member
    if current_member
      puts "**********************************"
      puts "current member is: #{current_member.email}"
      puts "Authentication token is: #{current_member.authentication_token}"
    else
      puts "**********************************"
      puts "Current member is Nil!: #{current_member}"

    end

  end


end
