class MembersController < ApplicationController

  before_action :authenticate_member!

  def index
    @members = Member.all.order(first_name: :asc)
  end

  def remove_from_app
    # this is called from the Remove from App button in the members/index.html.erb
    # it grabs the members passed within the params, sets the value of authorized_for_app to false
    # and saves it

    @member = Member.find(params[:id])
    @member.authorized_for_app = false

    if @member.save

      flash[:notice] = "Member removed from the app successfully"
      redirect_to members_path

    else

      flash[:alert] = "Something went wrong and the Member has not been removed from the app"
      redirect_to members_path

    end

  end # end remove_from_app

  def edit
    @member = Member.find(params[:id])
  end


  def update

    @member = Member.find(params[:id])

    if @member.update(member_params)
      flash[:notice] = "Member was successfully updated"
      redirect_to members_path

    else
      flash[:alert] = "The update was not successful"
      render 'edit'
    end


  end # end update

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "The member was successfully deleted"
    redirect_to members_path
  end

  def display_pending
    # this method is called from the Authorization Pending button in the navbar.
    # it searches in the DB for members that have the authorized_for_app boolean set to false.

    @members = Member.all.where(authorized_for_app: false).order(created_at: :desc)
  end


  def approve_access
    # this method gets the member id from the display_pending.html.erb
    # Then it changes the boolean authorized_for_app to true and saves it on the DB
    # at the end it runs the redirect_from_pending, which is a private method from the members controller

    @member = Member.find(params[:id])

    @member.authorized_for_app = true

    if @member.save

      flash[:notice] = "Access granted"
      
    else

      flash[:alert] = "Could not grant access"

    end

    redirect_from_pending


  end

  def deny_access
    # if a user has his/hers access denied from the awaiting for approval page, the user is deleted from the DB.
    # after the deletion, the function redirect_from_pending check if there's more requests to be approved and then
    # redirects it to the right page accordingly.

    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "User removed"

    redirect_from_pending

  end
  def access_level
    @members = Member.all.order(first_name: :asc)
  end

  def make_trip_coordinator

    @member = Member.find(params[:id])
    @member.update(:access_level => "TC")
    redirect_to access_level_path

  end

  def make_membership_admin

    @member = Member.find(params[:id])
    @member.update(:access_level => "MA")
    redirect_to access_level_path

  end
  def make_administrator
    #TODO: fix bug where any user can escalate himself to an admin.

    @member = Member.find(params[:id])
    @member.update(:access_level => "AD")
    redirect_to access_level_path

  end

  def deny_trip_coordinator

    @member = Member.find(params[:id])
    @member.update(:access_level => nil)
    redirect_to access_level_path

  end

  def deny_membership_admin

    @member = Member.find(params[:id])
    @member.update(:access_level => nil)
    redirect_to access_level_path
    
  end

  def deny_administrator

    @member = Member.find(params[:id])
    @member.update(:access_level => nil)
    redirect_to access_level_path

  end
  def search
    if params[:member_name].present?  
      @member_names= Member.search(params[:member_name])

      if @member_names
       
         render partial: 'members/result' 
      else  
      
          flash.now[:alert]= "Enter a valid symbol to search"
            render partial: 'members/result' 
              
      end
    else 
        flash.now[:alert]= "Enter symbol to search"
        render partial: 'members/result'
        
     


    end
    

  end



  private

  def member_params
    params.require(:member).permit(:email, :membership_number, :first_name, :last_name, :authorized_for_app, :access_level)
  end

  def redirect_from_pending
    # this method is called from members#approve_access and members#deny_access
    # I've created this method to check if the pending authorization list is empty on the DB
    # by using the is_pending_empty? method from the Member model.
    #   * If it is empty, it directs to members_path
    #   * If it is not empty, it directs to pending_path

    if Member.is_pending_empty?

      redirect_to members_path

    else
      redirect_to pending_path

    end

  end



end

