class Api::V1::AttendancesController < ApplicationController

  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for Member, fallback: :none


  def index
    @attendances = Attendance.all
  end


  def create
    @reservation = Attendance.new(
        event_id: params[:event_id],
        member_id: params[:member_id],
        time: params[:time]
    )

    if @reservation.save
      @event = Event.find(params[:event_id])
      @eventAttendance = @event.attendances
      render :create, status: :created
    else
      head(:bad_request)
    end
  end

  def destroy
    @reservation = Attendance.find(params[:id])

    if @reservation.destroy
      head(:ok)
    else
      head(:bad_request)
    end

  end


end
