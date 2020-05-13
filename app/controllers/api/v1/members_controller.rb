class Api::V1::MembersController < ApplicationController


  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for Member, fallback: :none

  def create

    #member = Member.where(email: params[:email]).first
    #
    #if @member&.valid_password?(params[:password])
    #  #member.save
    #  render :create, status: :created
    #else
    #  head(:unauthorized)
    #end
    #
    #display_current_member

    member = Member.new(
        email: params[:email],
        membership_number: params[:membership_number],
        first_name: params[:first_name],
        last_name: params[:last_name],
        authorized_for_app: false,
        password: params[:password],
        password_confirmation: params[:password_confirmation]
    )

    if member.save
      render json: {
          status: :created,
          member: member
      #TODO: FORMAT THE VIEW TO RETURN IT PROPERLY
      }
    else
      head(:bad_request)
    end

  end
end
