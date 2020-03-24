class MembersController < ApplicationController


  def index
    @members = Member.all
  end

  def remove_from_app

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
    @members = Member.all.where(authorized_for_app: false)
  end


  def approve_access
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

    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "User removed"

    redirect_from_pending

  end




  private

  def member_params
    params.require(:member).permit(:email, :membership_number, :first_name, :last_name, :authorized_for_app)
  end

  def redirect_from_pending

    if Member.is_pending_empty?

      redirect_to members_path

    else
      redirect_to pending_path

    end
  end



end

