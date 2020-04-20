class AttendancesController < ApplicationController
    def index
        @attendances = Attendance.group("attendances.member_id").order("count(attendances.member_id) DESC").count 
    end

    def create
        @attendance = Attendance.new(attendance_params)
        
    
        if @attendance.save
          
          flash[:success] = "Attendee successfully added to the event"
          redirect_to  attendance_path($current_event)
         
        end
        rescue ActiveRecord::RecordNotUnique => e
          if e
            flash[:notice] = "Member already on the list"
          redirect_to  attendance_path($current_event)
          
          end
      
      end # end create
    
    
    def show
        @attendance = Attendance.where(:event_id  => $current_event)
        puts $current_event

    end
    
  
    def destroy
        puts $current_event
        @attendance = Attendance.find(params[:id])
    
        @attendance.destroy
        flash[:notice] = "Attendee deleted"
        redirect_to  attendance_path($current_event)

    
    end # end destroy
    
      private
    
      def attendance_params
        params.permit(:event_id, :member_id, :time)
      end
    
end
