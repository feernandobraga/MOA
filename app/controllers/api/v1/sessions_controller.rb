class Api::V1::SessionsController < ApplicationController

  protect_from_forgery with: :null_session

  acts_as_token_authentication_handler_for Member, fallback: :none
  #before_action :authenticate_member!

  def index
    @members = Member.all

    render json: @members
  end

  def create
    member = Member.where(email: params[:email]).first

    if member&.valid_password?(params[:password])
      #member.save
      render json: member.as_json(only: [:id, :email, :membership_number, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end

    display_current_member

  end


  def destroy
    puts "###### DESTROY"
    if current_member

      display_current_member
    end

    if current_member

      current_member&.authentication_token = nil

      if current_member.save
        head(:ok)
      else
        head(:unauthorized)
      end

    else

      head(:unauthorized)

    end

    puts "#### FINISH DESTROY"
    if current_member
      display_current_member
    end
  end

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
