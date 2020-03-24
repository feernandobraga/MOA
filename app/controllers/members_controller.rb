class MembersController < ApplicationController


  def index
    @members = Member.all
  end

  def remove_from_app

    @member = Member.find(params[:id])
    @member.authorized_for_app = false

    if @member.save

      flash[:notice] = "User removed from the app successfully"
      redirect_to members_path

    else

      flash[:alert] = "Something went wrong and the user has not been removed from the app"
      redirect_to members_path

    end

  end # end remove_from_app

  def edit
    @member = Member.find(params[:id])
  end


  def update

    @member = Member.find(params[:id])

    if @member.update(member_params)
      flash[:notice] = "Member was successfully ipdated"
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

  #@members = Member.all.where(authorized_for_app: false)


  private

  def member_params
    params.require(:member).permit(:email, :membership_number, :first_name, :last_name, :authorized_for_app)
  end


end

