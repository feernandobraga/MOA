class Api::V1::SessionsController < ApplicationController

  def index
    @members = Member.all

    render json: @members
  end

end
