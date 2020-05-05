class AttendancesController < ApplicationController
    def index
      # date1="2020-01-01.beginning_of_day"
       #date2="2020-04-25.end.of.day"
         #@attendances = Attendance.where("attendances.time BETWEEN ? AND ?", date1, date2).group("attendances.member_id").order("count(attendances.member_id) DESC").count 
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
    def search
      if params[:date1].present? && params[:date2].present?
        date1= params[:date1].to_date
        date2= params[:date2].to_date
        puts date1
        puts date2
        @leader_search= Attendance.where("attendances.time BETWEEN ? AND ?", date1.beginning_of_day, date2.end_of_day).group("attendances.member_id").order("count(attendances.member_id) DESC").count 
        puts @leader_search
        

        render partial: 'leader_board'
        
        else 
          flash.now[:alert]= "Enter a valid range of dates"
         
           
      end
    end

      private
    
      def attendance_params
        params.permit(:event_id, :member_id, :time)
      end
    
end
