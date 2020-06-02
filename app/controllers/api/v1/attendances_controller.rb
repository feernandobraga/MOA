class Api::V1::AttendancesController < ApplicationController

  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for Member, fallback: :none


  def index

    if current_member
      @attendances = Attendance.all
    else
      head(:unauthorized)
    end
  end


  def create

    if current_member

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

    else
      head(:unauthorized)
    end


  end

  def destroy

    if current_member
      puts("DELETEEEE###############################this is working?? #{current_member}")
      @reservation = Attendance.find(params[:id])

      if @reservation.destroy
        head(:ok)
      else
        head(:bad_request)
      end

    else
      head(:unauthorized)
    end

  end

end



