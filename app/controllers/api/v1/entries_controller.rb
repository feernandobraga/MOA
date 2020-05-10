class Api::V1::EntriesController < ApplicationController

  acts_as_token_authentication_handler_for Member, fallback: :none


  def index
    #byebug
    display_current_member

    #if current_member
    if true
      @entries = Entry.all
      render :index, status: :ok
    else
      head(:unauthorized)
    end

  end

  def show
    @entry = Entry.find(params[:id])
  end


  private

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

  def entry_params
    params.require(:entry).permit( :title, :description, :member_id, :created_at)
  end


end


