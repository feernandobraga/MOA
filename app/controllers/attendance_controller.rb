class AttendanceController < ApplicationController
    def index
        @attendance = Attendance.all
      end

      def create
        @attendance = Attendance.new(attendance_params)
        @attendance.event = current_event

    
        if @attendance.save
          flash[:success] = "Attendee successfully added to the event"
          redirect_to events_path
        end
    
      end # end create
    
    
      def show
        @attendande = attendance.find(params[:id])
      end
    
      def edit
        @attendance = attendance.find(params[:id])
      end
    
    
      def update
        @attendance = attendance.find(params[:id])
    
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
